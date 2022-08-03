package dto

type ListAddRequest struct {
	UserId   string `json:"user_id"`
	RecipeId int    `json:"recipe_id"` //レシピID
}

//スワイプ用の情報を格納するための構造体
type RecipeMyList struct {
	UserId   string `json:"user_id"`
	RecipeId int    `json:"recipe_id"` //レシピID
}
