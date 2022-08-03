package dto

type RecipeListRequest struct {
	Tag int `json:"tag"`
	Id  int `json:"id"` //ulidに...
}

//スワイプ用の情報を格納するための構造体
type RecipeList struct {
	Id         string `json:"id"`
	RecipeName string `json:"name"`
	Url        string `json:"url"`
}
