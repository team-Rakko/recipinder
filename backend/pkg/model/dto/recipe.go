package dto

type RecipeListRequest struct {
	Tag int `json:"tag"`
	Id  int `json:"id"` //ulidに...
}

//スワイプ用の情報を格納するための構造体
type RecipeList struct {
	Id         string `json:"id"`
	RecipeName string `json:"name"`
	Url        string `json:"url"`
}

type RecipeDetailRequest struct {
	Id int `json:"id"` //レシピid
}

//レシピの詳細情報を格納する構造体
type RecipeDetail struct {
	RecipeName  string    `json:"name"`
	Description string    `json:"description"`
	Url         string    `json:"url"`
	Place       int       `json:"place"`
	Ingredients string    `json:"ingredients"`
	Evaluation  int       `json:"evaluation"`
	Kcal        int       `json:"kcal"`
	Time        int       `json:"time"`
	Process     []Process `json:"Process"`
}

type Process struct {
	Exp    string `json:"explanation"`
	Number string `json:"number"`
}

//CREATE TABLE IF NOT EXISTS `recipinder`.`recipis` (
//`id` MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'レシピID',
//`recipe_name` VARCHAR(64) NOT NULL COMMENT 'レシピネーム',
//`description` VARCHAR(512) NOT NULL COMMENT 'レシピ概要',
//`url` VARCHAR(128) NOT NULL COMMENT '料理画像URL',
//`place` integer NOT NULL COMMENT '値段',
//`ingredients` VARCHAR(64) NOT NULL COMMENT '材料ID',
//`tag` integer NOT NULL COMMENT 'tagid',
//`evaluation` integer NOT NULL COMMENT '評価',
//`created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '作成時',
//`updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新時',
//PRIMARY KEY (`id`)
//);
