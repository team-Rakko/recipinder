package dao

import (
	"database/sql"
	"errors"
	"fmt"
	"github.com/google/uuid"
	"log"
	"recipinder/pkg/model/dto"
)

const (
	InsertMyList = "INSERT INTO recipe_user (id,recipe_id,user_id) VALUES (?,?,?)"
	SelectMyList = "select recipe_user.recipe_id,recipis.recipe_name,recipis.url from recipe_user inner join recipis on recipe_user.recipe_id = recipis.id  where user_id = ?"
)

///post work
type addMyList struct {
}

func MakeAddListClient() addMyList {
	return addMyList{}
}

func (info *addMyList) Request(listInfo dto.ListAddRequest) error {

	u, err := uuid.NewRandom()
	if err != nil {
		fmt.Println(err)
		return err
	}
	uu := u.String()
	stmt, err := Conn.Prepare(InsertMyList)
	if err != nil {
		return err
	}
	_, err = stmt.Exec(uu, listInfo.RecipeId, listInfo.UserId)
	if err != nil {
		log.Println(err)
		return errors.New("Unable to insert data")
	}

	return err
}

type readMyList struct {
}

func MakeReadListClient() readMyList {
	return readMyList{}
}

var (
	rrm []dto.ReadRecipeMyList
	lrr dto.ListReadRequest
)

func (info *readMyList) Request(listInfo dto.ListReadRequest) ([]dto.ReadRecipeMyList, error) {

	var list []dto.ReadRecipeMyList
	rows, err := Conn.Query(SelectMyList, listInfo.UserId)
	if err != nil {
		log.Println(err)
		if err == sql.ErrNoRows {
			return rrm, errors.New("not exist data")
		}
	}
	defer rows.Close()
	for rows.Next() {
		recipe := &dto.ReadRecipeMyList{}
		if err := rows.Scan(&recipe.RecipeId, &recipe.RecipeName, &recipe.RecipeUrl); err != nil {
			return rrm, errors.New("exist nil work data")
		}
		list = append(list, *recipe)
	}
	if len(list) == 0 {
		return rrm, errors.New("recipe list id is wrong")
	}

	err = rows.Err()
	if err != nil {
		log.Println(err)
		return rrm, errors.New("err")
	}

	return list, err
}
