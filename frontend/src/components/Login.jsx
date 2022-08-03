import { auth } from '../firebase';
import { useEffect, useState, useContext } from 'react';
import { useNavigate } from 'react-router-dom';
import LoginButton from './LoginButton';
import "../assets/css/Login.css";
import { UserContext } from "../App"

function Login() {
    const {userInfo, setUserInfo} = useContext(UserContext);
    const navigate = useNavigate();

    useEffect(() => {

        // 認証チェック処理
        auth.onAuthStateChanged(user => {
            if (user) {
                const uid = user.uid;
                const userName = user.userName;
                const userInfo = {userName: userName, uid: uid};

                setUserInfo(userInfo); // ユーザー情報を保持
                navigate('/swipe'); // 画面遷移

            }
        });

    },[auth]);

    return (
      <div className="background">
        <div className="loginButton absolute top-96 left-30 z-10">
            <LoginButton />
        </div>

        <Message />

      </div>
    );
}


function Message() {
    const [hoverStyle, setHoverStyle] = useState({opacity: 0});

    const hover = () => {
        setHoverStyle({
                        transition: 'all .8s ease',
                        opacity: 0.7,
                     });
    }

    const leave = () => {
        setHoverStyle({
                        transition: 'all .8s ease',
                        opacity: 0,
                    });
    }
    return (
        <div>

            <div className="absolute top-0 left-0 half-screen h-full w-1/2 z-0" onMouseEnter={()=>hover()} onMouseLeave={()=>leave()}>
            </div>

            <div className="absolute top-1/4 left-1/2 bg-white bg-opacity-60 z-10 p-16 rounded-lg message" style={hoverStyle}>
                <div className="text-4xl flex justify-center">
                    <div className="text-center text-gray-800 leading-relaxed tracking-wide">
                        お金と健康を両立したい<br/>
                        あなたに。<br/>
                        素敵な料理と出会える<br/>
                        マッチングアプリ
                    </div>

                </div>
            </div>

        </div>
    );
  }

  export default Login;
  