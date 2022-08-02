package dao

import (
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

	return "", err
}
