package controller

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"recipinder/pkg/model/dao"
	"recipinder/pkg/model/dto"
	"recipinder/pkg/view"
)

func RecipeList() gin.HandlerFunc {
	return func(c *gin.Context) {
		log.Println("test")
		var rlr dto.RecipeListRequest
		if err := c.BindJSON(&rlr); err != nil {
			log.Println(err)
			view.ReturnErrorResponse(
				c,
				http.StatusBadRequest,
				"Bad Request",
				"Wrong request body",
			)
			return
		}

		client := dao.MakeReadRecipeClient()
		response, err := client.Request(rlr)
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

		c.JSON(http.StatusOK, response)
	}
}
