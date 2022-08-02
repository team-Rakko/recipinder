package main

import (
	"log"
	"recipinder/configs"
	"recipinder/pkg"
	"recipinder/pkg/model/dao"
)

func main() {
	//DBのコネクションを確率
	err := dao.Init()
	if err != nil {
		log.Fatal(err)
	}

	//サーバを起動
	addr := configs.GetServerPort()
	pkg.Server.Run(addr)
}
