import { auth } from '../firebase';
import { useEffect } from 'react';
import LoginButton from './LoginButton';
import axios from "axios";

function Login() {
    useEffect(() => {
        // バックエンドでのユーザー登録
        const login_confirm = async () => {
            const response = await axios.get('https://api.github.com/users/tagty');
            console.log(response.data)
        }
          
        // 認証チェック処理
        auth.onAuthStateChanged(user => {
            if (user) {
                login_confirm()
            }
            
        });

    },[auth]);

    return (
      <div>
        <LoginButton />
      </div>
    );
  }
  
  export default Login;
  