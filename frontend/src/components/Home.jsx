import { useState } from "react";
import reactLogo from "../assets/react.svg";
import "../App.css";
import LoginButton from "./LoginButton"

function Home() {
  return (
    <div>
      <LoginButton />
      <h1>Home</h1>
    </div>
  );
}

export default Home;
