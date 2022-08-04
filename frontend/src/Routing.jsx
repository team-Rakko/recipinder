import { Routes, Route, useNavigate } from "react-router-dom";
import { useContext, useEffect } from "react";
import { UserContext } from "./App";
import Test from "./components/Test.jsx";
import Home from "./components/Home.jsx";
import Login from "./components/Login.jsx";
import Swipe from "./components/Swipe.jsx";
import { Recipes } from "./components/Recipes/Recipes";
import { RecipeDetail } from "./components/Recipes/RecipeDetail";
import "./App.css";
import { Sidebar } from "./components/layouts/Sidebar";

function Routing() {
  const navigate = useNavigate();
  const { userInfo, setUserInfo } = useContext(UserContext);

  //   ログインされていなかったらログイン画面へ;
  useEffect(() => {
    if (!userInfo.login) {
      setUserInfo((userInfo) => ({
        ...userInfo,
        path: window.location.pathname,
      }));
      navigate("/login");
    }
  }, [userInfo.login]);

  return (
    <div>
      <Routes>
        <Route index element={<Sidebar />} />
        <Route path="/" element={<Sidebar />}></Route>
        <Route path="test" element={<Sidebar />}></Route>
        <Route path="swipe" element={<Sidebar />}></Route>
        <Route path="recipes" element={<Sidebar />}></Route>
        <Route path="detail" element={<Sidebar />}></Route>
      </Routes>

      <Routes>
        <Route index element={<Home />} />
        <Route path="/" element={<Home />}></Route>
        <Route path="test" element={<Test />}></Route>
        <Route path="login" element={<Login />}></Route>
        <Route path="swipe" element={<Swipe />}></Route>
        <Route path="recipes" element={<Recipes />}></Route>
        <Route path="detail" element={<RecipeDetail />}></Route>
      </Routes>
    </div>
  );
}

export default Routing;
