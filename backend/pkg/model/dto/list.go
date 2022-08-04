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

type ListReadRequest struct {
	UserId int `json:"user_id"`
}

//スワイプ用の情報を格納するための構造体
type ReadRecipeMyList struct {
	RecipeId   int    `json:"recipe_id"` //レシピID
	RecipeName string `json:"name"`
	RecipeUrl  string `json:"url"`
}
