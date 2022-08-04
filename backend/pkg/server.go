package pkg

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"recipinder/pkg/controller"
)

var (
	Server *gin.Engine
)

func init() {

	Server = gin.Default()
	Server.Use(cors.Default())

	//ユーザ関連
	Server.POST("/sign/up", controller.SignUp())

	//レシピ関連
	Server.POST("/recipe/list", controller.RecipeList())
	Server.POST("/recipe/detail", controller.RecipeDetail())

	//マイリスト関連
	Server.POST("/list", controller.ListMyRecipe())
	Server.POST("/list/user", controller.ReadListMyRecipe())
	//レビュー関連
	Server.POST("/review", controller.RecipeReview())
}
