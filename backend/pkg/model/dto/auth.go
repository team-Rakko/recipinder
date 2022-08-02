package dto

//アカウント作成リクエスト
type SignUpRequest struct {
	Id   string `json:"id"` //user uuid
	Name string `json:"name"`
}

