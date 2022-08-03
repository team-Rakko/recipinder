package view

type SignResponse struct {
	Id string `json:"id"`
}

func ReturnSignResponse(id string) SignResponse {
	body := SignResponse{
		Id: id,
	}
	return body
}
