import { auth } from '../firebase';
import { useEffect } from 'react';
import LoginButton from './LoginButton';
import "../assets/css/Login.css";

function Login() {
    useEffect(() => {
    
        // 認証チェック処理
        auth.onAuthStateChanged(user => {
            console.log('認証チェック', user);
        });

    },[auth]);

    return (
      <div className="background">
        <div className="loginButton">
            <LoginButton />
        </div>
      </div>
    );
  }
  
  export default Login;
  