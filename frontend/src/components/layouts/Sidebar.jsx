import House from "../../assets/images/house.svg";
import Search from "../../assets/images/search.svg";
import List from "../../assets/images/list.svg";
import { useNavigate } from "react-router-dom";
import { Menu } from "./Menu";
import { useState, useEffect } from "react";
import "../../assets/css/menu.css";
export const Sidebar = () => {
  const navigate = useNavigate();
  const [hover, setHover] = useState(false);
  const [styles, setStyles] = useState("left-10");

  return (
    <div
      onMouseLeave={() => {
        setTimeout(() => {
          setHover(false);
        }, 80);
        setStyles("left-10 opacity-0 sm:w-3/4 w-full");
      }}
    >
      <div className="bg-white grid sm:grid-cols-1 grid-cols-3 absolute sm:gap-10 gap-10 sm:py-10 py-3 sm:px-3 px-10 place-items-center justify-items-center rounded-lg top-5 left-5 z-20">
        <img
          src={Search}
          alt=""
          className="w-8 h-8 hover:opacity-60"
          onMouseEnter={() => {
            setHover(true);
            setTimeout(() => {
              setStyles(
                "left-0 sm:left-14 sm:top-5 top-20 sm:w-3/4 w-full opacity-100"
              );
            }, 40);
          }}
        />
        <button onClick={() => navigate("/swipes")}>
          <img src={House} alt="" className="w-8 h-8 hover:opacity-60" />
        </button>
        <button onClick={() => navigate("/recipes")}>
          <img src={List} alt="" className="w-8 h-8 hover:opacity-60" />
        </button>
      </div>
      {hover && <Menu hover={styles} />}
    </div>
  );
};
