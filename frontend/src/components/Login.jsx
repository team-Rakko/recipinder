import { auth } from "../firebase";
import { useEffect, useState, useContext } from "react";
import { useNavigate } from "react-router-dom";
import LoginButton from "./LoginButton";
import "../assets/css/Login.css";
import { UserContext } from "../App";
import { signUp } from "../lib/api";

function Login() {
  const { userInfo, setUserInfo } = useContext(UserContext);
  const navigate = useNavigate();

  useEffect(() => {
    //バックエンドでのユーザー登録
    const confirmSignIn = async (userData) => {
      try {
        const res = await signUp(userData);
        console.log(res);

        if (res.status === 200) {
          return navigate(userData.path); // 画面遷移
        }
      } catch (e) {
        const status = e.response.status;
        if (status === 400) {
          // すでに登録されている場合
          return navigate(userData.path); // 画面遷移
        } else {
          alert("ログイン失敗しました");
        }
      }
    };

    // 認証チェック処理
    auth.onAuthStateChanged((user) => {
      if (user) {
        const path = userInfo.path;
        const type = userInfo.type;
        const uid = user.uid;
        const userName = user.displayName;
        const userData = {
          name: userName,
          id: uid,
          login: true,
          path: path,
          type: type,
        };

        setUserInfo(userData); // ユーザー情報を保持
        confirmSignIn(userData);
      }
    });
  }, [auth]);

  return (
    <div className="background pt-20">
      <div className="bg-gray-500 bg-opacity-30">
        <h1 className="title text-center text-white">recipinder</h1>
        <p class="message text-center text-white py-5">
          お金と健康を両立したいあなたに
        </p>
      </div>

      <div className="justify-center flex pt-40">
        <LoginButton />
      </div>
    </div>
  );
}

export default Login;
