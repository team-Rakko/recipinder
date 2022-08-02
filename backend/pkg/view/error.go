package view

import "github.com/gin-gonic/gin"

type Error struct {
	Code        int    `json:"code"`
	Message     string `json:"message"`
	Description string `json:"description"`
}

func ReturnErrorResponse(c *gin.Context, code int, msg, desc string) {
	body := Error{
		Code:        code,
		Message:     msg,
		Description: desc,
	}
	c.JSON(code, body)
}
