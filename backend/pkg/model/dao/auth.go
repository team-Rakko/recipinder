package dao

import (
	"github.com/go-sql-driver/mysql"
	"recipinder/pkg/model/dto"
)

const (
	InsertUserInfoQuery = "INSERT INTO `users` (id,name) VALUES (?,?)"
)

// sign/up
type signUp struct {
}

func MakeSignUpClient() signUp {
	return signUp{}
}

func (info *signUp) Request(userInfo dto.SignUpRequest) (string, error) {

	stmt, err := Conn.Prepare(InsertUserInfoQuery)
	if err != nil {
		return "", err
	}

	_, err = stmt.Exec(userInfo.Id, userInfo.Name)
	if mysqlErr, ok := err.(*mysql.MySQLError); ok {
		if mysqlErr.Number == 1062 {
			return "1062", err
		}
	}

	return "", err
}
