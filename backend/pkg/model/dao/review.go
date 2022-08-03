package dao

import (
	"errors"
	"fmt"
	"github.com/google/uuid"
	"log"
	"recipinder/pkg/model/dto"
)

const (
	InsertReview = "INSERT INTO review (id,recipe_id,evaluation) VALUES (?,?,?)"
)

type readRecipeReview struct {
}

func MakeReadRecipeReviewClient() readRecipeReview {
	return readRecipeReview{}
}

//var (
//	rd  dto.RecipeDetail
//	rdr dto.RecipeDetailRequest
//)

func (info *readRecipeReview) Request(reviewInfo dto.RecipeReviewRequest) error {

	u, err := uuid.NewRandom()
	if err != nil {
		fmt.Println(err)
		return err
	}
	uu := u.String()
	stmt, err := Conn.Prepare(InsertReview)
	if err != nil {
		return err
	}
	_, err = stmt.Exec(uu, reviewInfo.Id, reviewInfo.Evaluation)
	if err != nil {
		log.Println(err)
		return errors.New("Unable to insert data")
	}

	return err
}
