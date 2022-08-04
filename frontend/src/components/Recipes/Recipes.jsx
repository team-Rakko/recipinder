import "../../assets/css/recipes/recipeDetail.css";
import { Recipe } from "./Recipe";
import { useState, useEffect, useContext } from "react";
import { getlist } from "../../lib/api";
import { UserContext } from "../../App";

export const Recipes = () => {
  const { userInfo, setUserInfo } = useContext(UserContext);
  const [myList, setMyList] = useState([]);

  useEffect(() => {
    const sendData = {
      user_id: userInfo.id, // conTextからuserIdを取得するようにする。多分バックエンドでuser_idをintで扱ってるからstringにしてもらう
    };

    getlist(sendData).then((myListData) => {
      setMyList(myListData.data);
    });
  }, []);

  return (
    <div className="back-gradation-for-detail">
      <p className="text-center text-2xl py-10">リスト一覧</p>
      <div className="grid md:grid-cols-4 grid-cols-2 place-items-center justify-items-center gap-5 md:px-20 px-5">
        {myList.map((recipe) => {
          return <Recipe key={recipe.recipe_id} data={recipe} />;
        })}
      </div>
    </div>
  );
};
