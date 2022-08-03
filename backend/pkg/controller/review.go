package controller

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"recipinder/pkg/model/dao"
	"recipinder/pkg/model/dto"
	"recipinder/pkg/view"
)

func RecipeReview() gin.HandlerFunc {
	return func(c *gin.Context) {
		var rrr dto.RecipeReviewRequest
		if err := c.BindJSON(&rrr); err != nil {
			log.Println(err)
			view.ReturnErrorResponse(
				c,
				http.StatusBadRequest,
				"Bad Request",
				"Wrong request body",
			)
			return
		}

		client := dao.MakeReadRecipeReviewClient()
		err := client.Request(rrr)
		if err != nil {
			log.Println(err)
			view.ReturnErrorResponse(
				c,
				http.StatusInternalServerError,
				"Internal Server Error",
				err.Error(),
			)
			return
		}

		me := "success"

		c.JSON(http.StatusOK, view.ReturnReviewResponse(me))
	}
}
