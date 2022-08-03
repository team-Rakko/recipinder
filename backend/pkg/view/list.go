package view

type ListResponse struct {
	Message string `json:"message"`
}

func ReturnListResponse(message string) ListResponse {
	body := ListResponse{
		Message: message,
	}
	return body
}
