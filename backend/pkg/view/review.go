package view

type ReviewResponse struct {
	Message string `json:"message"`
}

func ReturnReviewResponse(message string) ReviewResponse {
	body := ReviewResponse{
		Message: message,
	}
	return body
}
