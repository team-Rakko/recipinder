package dao

import (
	"database/sql"
	"errors"
	"log"
	"recipinder/pkg/model/dto"
)

const (
	//select work
	SelectRecipeList   = "select recipis.id,recipis.recipe_name,recipis.url from recipis where id > ? and tag = ? limit 10"
	SelectRecipeDetail = "select recipis.recipe_name,recipis.description,recipis.url,recipis.place,recipis.ingredients,recipis.evaluation from recipis where id = ?"
)

///post work
type readRecipe struct {
}

func MakeReadRecipeClient() readRecipe {
	return readRecipe{}
}

var (
	rw  []dto.RecipeList
	cwr dto.RecipeListRequest
)

func (info *readRecipe) Request(recipeInfo dto.RecipeListRequest) ([]dto.RecipeList, error) {

	var list []dto.RecipeList

	rows, err := Conn.Query(SelectRecipeList, recipeInfo.Id, recipeInfo.Tag)
	if err != nil {
		log.Println(err)
		if err == sql.ErrNoRows {
			return rw, errors.New("not exist data")
		}
	}
	defer rows.Close()
	for rows.Next() {
		recipe := &dto.RecipeList{}
		if err := rows.Scan(&recipe.Id, &recipe.RecipeName, &recipe.Url); err != nil {
			return rw, errors.New("exist nil work data")
		}
		list = append(list, *recipe)
	}
	if len(list) == 0 {
		return rw, errors.New("recipe list id is wrong")
	}

	err = rows.Err()
	if err != nil {
		log.Println(err)
		return rw, errors.New("err")
	}

	return list, err
}

type readRecipeDetail struct {
}

func MakeReadRecipeDetailClient() readRecipeDetail {
	return readRecipeDetail{}
}

var (
	rd  dto.RecipeDetail
	rdr dto.RecipeDetailRequest
)

func (info *readRecipeDetail) Request(recipeInfo dto.RecipeDetailRequest) (dto.RecipeDetail, error) {

	var err error
	var recipe dto.RecipeDetail
	row := Conn.QueryRow(SelectRecipeDetail, recipeInfo.Id)
	if err := row.Scan(&recipe.RecipeName, &recipe.Description, &recipe.Url, &recipe.Place, &recipe.Ingredients, &recipe.Evaluation); err != nil {
		if err == sql.ErrNoRows {
			return rd, errors.New("")
		}
		log.Println(err)
	}

	return recipe, err
}
