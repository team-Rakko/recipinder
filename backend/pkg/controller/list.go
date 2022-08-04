package controller

import (
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"recipinder/pkg/model/dao"
	"recipinder/pkg/model/dto"
	"recipinder/pkg/view"
)

func ListMyRecipe() gin.HandlerFunc {
	return func(c *gin.Context) {
		var lar dto.ListAddRequest
		if err := c.BindJSON(&lar); err != nil {
			log.Println(err)
			view.ReturnErrorResponse(
				c,
				http.StatusBadRequest,
				"Bad Request",
				"Wrong request body",
			)
			return
		}

		client := dao.MakeAddListClient()
		err := client.Request(lar)
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
		c.JSON(http.StatusOK, view.ReturnListResponse(me))
	}
}

func ReadListMyRecipe() gin.HandlerFunc {
	return func(c *gin.Context) {
		var rrl dto.ListReadRequest
		if err := c.BindJSON(&rrl); err != nil {
			log.Println(err)
			view.ReturnErrorResponse(
				c,
				http.StatusBadRequest,
				"Bad Request",
				"Wrong request body",
			)
			return
		}

		client := dao.MakeReadListClient()
		response, err := client.Request(rrl)
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
