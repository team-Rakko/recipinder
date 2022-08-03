package dto

type RecipeReviewRequest struct {
	Id         int `json:"id"` //レシピID
	Evaluation int `json:"evaluation"`
}
