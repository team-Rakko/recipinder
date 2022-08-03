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
    const confirmSignIn = async (userInfo) => {
        try {
          const res = await signUp(userInfo);
          console.log(res);
    
          if (res.status === 200) {
            navigate("/swipe"); // 画面遷移
          } 
        } catch (e) {
            const status = e.response.status;
            if (status === 400) { // すでに登録されている場合
                navigate("/swipe"); // 画面遷移
            }
            else {
                alert("ログイン失敗しました");
            }
          
        }
    };

    // 認証チェック処理
    auth.onAuthStateChanged((user) => {
      if (user) {
        const uid = user.uid;
        const userName = user.userName;
        const userInfo = { name: userName, id: uid };

        setUserInfo(userInfo); // ユーザー情報を保持

        confirmSignIn(userInfo);
        navigate("/swipe"); // 画面遷移
      }
    });
  }, [auth]);

  return (
    
    <div className="background pt-20">
      
      <div className="bg-gray-500 bg-opacity-30">
        <h1 className="title text-center text-white">recipinder</h1>
      </div>
      
      <div className="justify-center flex pt-40">
        <LoginButton />
      </div>

      {/* <Message /> */}

    </div>
  );
}

function Message() {
  const [hoverStyle, setHoverStyle] = useState({ opacity: 0.7 });

  const hover = () => {
    setHoverStyle({
      transition: "all .8s ease",
      opacity: 0.7,
    });
  };

  const leave = () => {
    setHoverStyle({
      transition: "all .8s ease",
      opacity: 0,
    });
  };
  return (
    <div>
      {/* <div
        className="absolute top-0 left-0 half-screen h-full w-1/2 z-0"
        onMouseEnter={() => hover()}
        onMouseLeave={() => leave()}
      ></div> */}

      <div className="bg-white bg-opacity-60 z-10 pt-2 before:rounded-lg message">
        <div className="flex justify-center">
          <div className="text-center text-gray-800 leading-relaxed tracking-wide">
            お金と健康を両立したい
            <br />
            あなたに。
            <br />
            素敵な料理と出会える
            <br />
            マッチングアプリ
          </div>
        </div>
      </div>
    </div>
  );
}

export default Login;
