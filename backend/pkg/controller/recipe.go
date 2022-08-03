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

func RecipeDetail() gin.HandlerFunc {
	return func(c *gin.Context) {
		var rdr dto.RecipeDetailRequest
		if err := c.BindJSON(&rdr); err != nil {
			log.Println(err)
			view.ReturnErrorResponse(
				c,
				http.StatusBadRequest,
				"Bad Request",
				"Wrong request body",
			)
			return
		}

		client := dao.MakeReadRecipeDetailClient()
		response, err := client.Request(rdr)
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
