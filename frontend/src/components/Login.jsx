import { auth } from '../firebase';
import { useEffect } from 'react';
import LoginButton from './LoginButton';

function Login() {
    useEffect(() => {
    
        // 認証チェック処理
        auth.onAuthStateChanged(user => {
            console.log('認証チェック', user);
        });

    },[auth]);

    return (
      <div>
        <LoginButton />
      </div>
    );
  }
  
  export default Login;
  