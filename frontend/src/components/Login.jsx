import { auth } from '../firebase';
import { useEffect } from 'react';
import LoginButton from "./LoginButton"

function Login() {
    // const [user] = useAuthState(auth)
  
    useEffect(() => {
        
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