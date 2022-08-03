import { useState } from "react";
import reactLogo from "../assets/react.svg";
import "../App.css";
import { signUp, recipeList, recipeDetail, list } from "../lib/api.jsx";
import axios from "axios";

function Test() {
  const data1 = {
    id: "laadsfad",
    name: "keita",
  };
  const sendSignUp = async (data) => {
    try {
      const res = await signUp(data);
      console.log(res);

      if (res.status === 200) {
        console.log("test");
      } else {
        console.log("test2");
      }
    } catch (err) {
      console.log(err);
    }
  };

  const data2 = {
    tag: 0,
    id: 11,
  };
  const sendRecipeList = async (data) => {
    try {
      const res = await recipeList(data);
      console.log(res);
      if (res.status === 200) {
        console.log("test");
      } else {
        console.log("test2");
      }
    } catch (err) {
      console.log(err);
    }
  };

  const data3 = {
    id: 1,
  };
  const sendRecipeDetail = async (data) => {
    try {
      const res = await recipeDetail(data);
      console.log(res);
      if (res.status === 200) {
        console.log("test");
      } else {
        console.log("test2");
      }
    } catch (err) {
      console.log(err);
    }
  };

  const data4 = {
    user_id: "aihsdfi", //ユーザ　ID
    recipe_id: 5, //レシピID
  };
  const sendList = async (data) => {
    try {
      const res = await list(data);
      console.log(res);
      if (res.status === 200) {
        console.log("test");
      } else {
        console.log("test2");
      }
    } catch (err) {
      console.log(err);
    }
  };

  return (
    <div>
      <button onClick={() => sendSignUp(data1)}>signUp</button>
      <br />
      <button onClick={() => sendRecipeList(data2)}>sendRecipeList</button>
      <br />
      <button onClick={() => sendRecipeDetail(data3)}>sendRecipeDetail</button>
      <br />
      <button onClick={() => sendList(data4)}>sendList</button>
      <br />
    </div>
  );
}

export default Test;
