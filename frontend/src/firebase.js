import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { GoogleAuthProvider } from "firebase/auth";

const firebaseConfig = {
apiKey: import.meta.env.VITE_API_KEY,
authDomain: import.meta.env.VITE_AUTH_DOMAIN,
projectId: import.meta.env.VITE_PROJECT_ID,
storageBucket: import.meta.env.VITE_STORAGE_BUCKETY,
messagingSenderId: import.meta.env.VITE_MESSAGING_SENDER_ID,
appId: import.meta.env.VITE_APP_ID
};
// const firebaseConfig = {
//     apiKey: "AIzaSyAtrYxazFwRhrGxvEFGgoH48lEkI5tyKtY",
//     authDomain: "shamer-4a9aa.firebaseapp.com",
//     projectId: "shamer-4a9aa",
//     storageBucket: "shamer-4a9aa.appspot.com",
//     messagingSenderId: "1014648734822",
//     appId: "1:1014648734822:web:3da1a4a1de250c39a759a7"
//   };

// googleのログイン認証
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const provider = new GoogleAuthProvider();


export { auth, provider };