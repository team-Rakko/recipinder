package dao

import (
	"errors"
	"fmt"
	"github.com/google/uuid"
	"log"
	"recipinder/pkg/model/dto"
)

const (
	InsertMyList = "INSERT INTO recipe_user (id,recipe_id,user_id) VALUES (?,?,?)"
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
		return errors.New("Unable to insert work data")
	}

	return err
}
