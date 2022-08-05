import React, { useState, useMemo, useRef, useEffect, useContext } from "react";
import { useNavigate } from "react-router-dom";
import TinderCard from "react-tinder-card";
import "../assets/css/swipe.css";
import { ConfirmationModal } from "./ConfirmationModal";
import { UserContext } from "../App";
import { list } from "../lib/api";

function Swipe() {
  var data = {
    tag: 0,
    id: 1,
  };
  const { userInfo, setUserInfo } = useContext(UserContext);
  // 興味ありの処理
  const addMyList = (recipeId) => {
    const sendData = {
      user_id: userInfo.id,
      recipe_id: Number(recipeId),
    };

    list(sendData).catch((e) => {
      alert("エラーが発生しマイリストに追加できませんでした。");
    });
  };

  useEffect(() => {
    data = {
      tag: userInfo.type,
      id: 1,
    };
    var obj = fetch("https://recepiender.home.k1h.dev/recipe/list", {
      method: "POST",
      body: JSON.stringify(data),
    }).then((res) => {
      return res.json();
    });
    obj
      .then((json) => {
        if (prevData != null) {
          json = json.slice(0, -2);
          json = prevData.reverse().concat(json);
        }

        json = json.reverse();
        newCurrentIndex = json.length;
        setDb((preSetting) => ({
          ...preSetting,
          data: json,
        }));
        setCurrentIndex(newCurrentIndex - 1);
      })
      .catch((err) => console.log(err));

    console.log(data);
  }, [userInfo.type]);

  // const location = useLocation();
  const navigate = useNavigate();
  const [modal, setModal] = useState(false);
  const [currentIndex, setCurrentIndex] = useState();
  const [lastDirection, setLastDirection] = useState();
  const currentIndexRef = useRef(currentIndex);

  const [key, setKey] = useState("");
  const [count, setCount] = useState(1);
  const [db, setDb] = useState({ data: [] });
  var newCurrentIndex = 10;
  var prevData = null;

  useEffect(() => {
    if (currentIndex != undefined && currentIndex > 1) {
      return;
    } else if (currentIndex == 1) {
      let lastId = db.data[0].id;
      prevData = db.data.slice(0, 2);
      data = {
        tag: 0,
        id: Number(lastId),
      };
    }

    var obj = fetch("https://recepiender.home.k1h.dev/recipe/list", {
      method: "POST",
      body: JSON.stringify(data),
    }).then((res) => {
      return res.json();
    });
    obj
      .then((json) => {
        if (prevData != null) {
          json = json.slice(0, -2);
          json = prevData.reverse().concat(json);
        }

        json = json.reverse();
        newCurrentIndex = json.length;
        setDb((preSetting) => ({
          ...preSetting,
          data: json,
        }));
        setCurrentIndex(newCurrentIndex - 1);
      })
      .catch((err) => console.log(err));
  }, [currentIndex]);

  const childRefs = useMemo(
    () =>
      Array(newCurrentIndex)
        .fill(0)
        .map((i) => React.createRef()),
    [newCurrentIndex]
  );

  const updateCurrentIndex = (val) => {
    setCurrentIndex(val);
  };

  const canGoBack = currentIndex < db.data.length - 1;

  const canSwipe = currentIndex >= 0;

  // set last direction and decrease current index
  const swiped = (direction, nameToDelete, index) => {
    setLastDirection(direction);
    updateCurrentIndex(index - 1);
  };

  const swipe = async (dir) => {
    if (dir == "right") {
      addMyList(db.data[currentIndex].id); //マイリストに追加
    }

    if (canSwipe && currentIndex < db.data.length) {
      await childRefs[currentIndex].current.swipe(dir); // Swipe the card!
    }
  };

  // increase current index and show card
  const goBack = async () => {
    if (!canGoBack) return;
    const newIndex = currentIndex + 1;
    updateCurrentIndex(newIndex);
    await childRefs[newIndex].current.restoreCard();
  };

  window.addEventListener("keydown", (e) => {
    if (e.key === "ArrowRight" || "ArrowLeft" || "ArrowLeft") {
      if (e.key === "ArrowRight") {
        swipe("right");
        e.preventDefault();
      } else if (e.key === "ArrowLeft") {
        swipe("left");
      } else if (e.key === "ArrowUp") {
        navigate("/detail", { state: { id: 1 } });
      }
    }
    if (key == e.code) {
      setKey("");
      setKey(e.code);
    } else {
      setKey(() => e.code);
    }
  });

  return (
    <div className="">
      <div className="back-gradation absolute top-0 right-0"></div>
      <div className="shadow-2xl pb-10 absolute top-96 bg-white swiper-container rounded-md mt-5">
        {modal && <ConfirmationModal />}
        <div className="grid grid-cols-1 relative sm:my-40 my-24">
          <div className="">
            {db.data.map((character, index) => (
              <TinderCard
                ref={childRefs[index]}
                key={character.id}
                onSwipe={(dir) => {
                  swiped(dir, character.name, index);
                  if (dir == "right") {
                    addMyList(db.data[index].id); //マイリストに追加
                  }
                }}
                onCardLeftScreen={() => {
                  outOfFrame(character.name, index);
                }}
              >
                <div className="absolute swiper w-96 h-auto">
                  <div className="my-1 mx-auto">
                    <img
                      src={character.url}
                      alt=""
                      className="w-full h-90 rounded-md flex justify-center mt-4"
                    />

                    <p className="break-words w-full py-10 text-center text-xl bg-white rounded-md">
                      {character.name}
                    </p>
                  </div>
                </div>
              </TinderCard>
            ))}
          </div>
        </div>
        <div className=" grid lg:grid-cols-3 grid-cols-1 md:mx-20 mx-5 gap-5">
          <button
            className="shadow-lg sm:py-5 py-2 px-10 rounded-md button"
            onClick={() => swipe("left")}
          >
            興味がない
          </button>
          <button
            className="shadow-lg lg:py-5 py-2 rounded-md button"
            onClick={() => {
              localStorage.setItem("recipeId", db.data[currentIndex].id);
              navigate("/detail");
            }}
          >
            今作る
          </button>
          <button
            className="shadow-lg lg:py-5 py-2 rounded-md button"
            onClick={() => {
              swipe("right");
            }}
          >
            興味がある
          </button>
        </div>
      </div>
    </div>
  );
}
export default Swipe;
