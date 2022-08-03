import { signInWithPopup } from 'firebase/auth';
import { auth, provider } from '../firebase';
import googleButton from '../assets/images/googleButton.png' 

function SignInButton() {
  
    //googleのログイン認証popupを表示
    const signInGoogle = () => {
        signInWithPopup(auth, provider)
        .catch((e) => {
            alert("ユーザー認証が行われませんでした。");
        });
    }

    return (
        <div>
            <img src={googleButton} height ="60" width="250" onClick={signInGoogle} />
        </div>
    );
}

export default SignInButton;