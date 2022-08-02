package dao

import (
	"database/sql"
	"fmt"
	"log"
	"recipinder/configs"

	"github.com/cenkalti/backoff"

	// blank import for MySQL driver
	_ "github.com/go-sql-driver/mysql"
)

// Driver名
const DriverName = "mysql"

// Conn 各repositoryで利用するDB接続(Connection)情報
var Conn *sql.DB
var DBConnectionInfo string

func Init() error {
	var err error
	DBConnectionInfo = configs.GetDBConnectionInfo()
	if err = createDBConnection(); err != nil {
		if err = dbConnectionBackoff(); err != nil {
			return err
		}
	}
	log.Println("Successfull DB Connection")
	return err
}

func createDBConnection() error {
	var err error
	Conn, err = sql.Open(DriverName, DBConnectionInfo)
	if err != nil {
		return err
	}
	if err = Conn.Ping(); err != nil {
		return err
	}
	return nil
}

func dbConnectionBackoff() error {
	b := backoff.WithMaxRetries(backoff.NewExponentialBackOff(), 7)
	err := backoff.Retry(Conn.Ping, b)
	if err != nil {
		log.Println(fmt.Errorf("Faild create connection"))
		return err
	}
	return err
}
