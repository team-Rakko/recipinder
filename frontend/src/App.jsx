import { BrowserRouter, Routes, Route } from 'react-router-dom';
import { createContext, useState } from 'react';
import Test from './components/Test.jsx';
import Home from './components/Home.jsx';
import Login from './components/Login.jsx';
import Swipe from './components/Swipe.jsx';
import './App.css';
import { Sidebar } from './components/layouts/Sidebar';
export const UserContext = createContext();

function App() {
  // useContextとuseStateを連携し値を別コンポーネントで変更可能
  const [userInfo, setUserInfo] = useState({ userName: '', uid: '' });
  const contextValue = { userInfo, setUserInfo };

  return (
    <UserContext.Provider value={contextValue}>
      <Sidebar />
      <BrowserRouter>
        <Routes>
          <Route index element={<Home />} />
          <Route path="/" element={<Home />}></Route>
          <Route path="test" element={<Test />}></Route>
          <Route path="login" element={<Login />}></Route>
          <Route path="swipe" element={<Swipe />}></Route>
        </Routes>
      </BrowserRouter>
    </UserContext.Provider>
  );
}
export default App;
