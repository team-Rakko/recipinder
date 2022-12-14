import { BrowserRouter, Routes, Route } from "react-router-dom";
import { createContext, useState, useEffect } from "react";
import Routing from "./Routing";
import "./App.css";
export const UserContext = createContext();

function App() {
  // useContextとuseStateを連携し値を別コンポーネントで変更可能
  const [userInfo, setUserInfo] = useState({
    userName: "",
    uid: "",
    login: false,
    path: "/swipes",
    type: 0,
    viewId: 1,
  });
  const contextValue = { userInfo, setUserInfo };

  return (
    <UserContext.Provider value={contextValue}>
      <BrowserRouter>
        <Routing />
      </BrowserRouter>
    </UserContext.Provider>
  );
}

export default App;
