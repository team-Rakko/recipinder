package configs

import (
	"flag"
	"fmt"
	"github.com/kelseyhightower/envconfig"
	"log"
	"os"
)

const accessTokenTemplate = "%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True&loc=Local"

type databaseConfig struct {
	User string `envconfig:"DB_USER" default:"recipinder"`
	Pass string `envconfig:"DB_PASSWORD" default:"recipinder_pass"`
	IP   string `envconfig:"DB_IP" default:"mysql"`
	Port string `envconfig:"DB_PORT" default:"3306"`
	Name string `envconfig:"DB_NAME" default:"recipinder"`
}

func GetServerPort() string {
	var addr string
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	// 接続情報は以下のように指定する.
	// user:password@tcp(host:port)/database
	flag.StringVar(&addr, "addr", ":"+port, "tcp host:port to connect")
	flag.Parse()
	return addr
}

func GetDBConnectionInfo() string {
	/* ===== データベースへ接続する. ===== */
	var config databaseConfig
	if err := envconfig.Process("", &config); err != nil {
		log.Fatal("Unable to connect to DB(Insufficient variables)")
	}
	return fmt.Sprintf(accessTokenTemplate, config.User, config.Pass, config.IP, config.Port, config.Name)
}
