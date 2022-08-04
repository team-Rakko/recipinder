import React, { useState, useMemo, useRef, useEffect, useContext } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import TinderCard from "react-tinder-card";
import "../assets/css/swipe.css";
import { ConfirmationModal } from "./ConfirmationModal";
import { recipeList } from "../lib/api.jsx";
import { UserContext } from "../App";

var data = {
  tag: 0,
  id: 1,
};
// const sendRecipeList = async (data) => {
//   try {
//     const res = await recipeList(data);
//     if (res.status === 200) {
//     } else {
//     }
//   } catch (err) {
//     console.log(err);
//   }
// };

function Swipe() {
  const { userInfo, setUserInfo } = useContext(UserContext);
  useEffect(() => {
    console.log(userInfo.type);
  }, [userInfo.type]);

  const location = useLocation();
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
    var obj = fetch("http://118.27.15.162/recipe/list", {
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
  // 画面外に出た時にこれが実行されるのはラグがある
  const outOfFrame = (name, idx) => {
    // console.log(`${name} (${idx}) left the screen!`, currentIndexRef.current);
    // handle the case in which go back is pressed before card goes outOfFrame
    // currentIndex >= idx && childRefs[idx].current.restoreCard();
    // TODO: when quickly swipe and restore multiple times the same card,
    // it happens multiple outOfFrame events are queued and the card disappear
    // during latest swipes. Only the last outOfFrame event should be considered valid
  };

  const swipe = async (dir) => {
    // debugger;
    // debugger;
    if (canSwipe && currentIndex < db.data.length) {
      // debugger;
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
  });

  return (
    <div>
      <div className="back-gradation absolute top-0 right-0"></div>
      <div className="shadow-2xl pb-10 absolute bg-white swiper-container rounded-md">
        {modal && <ConfirmationModal />}
        <div className="grid grid-cols-1 relative sm:my-40 my-24">
          <div className="">
            {db.data.map((character, index) => (
              <TinderCard
                ref={childRefs[index]}
                key={character.id}
                onSwipe={(dir) => swiped(dir, character.name, index)}
                onCardLeftScreen={() => {
                  outOfFrame(character.name, index);
                }}
              >
                <div className="absolute swiper">
                  <div className="flex justify-center">
                    <img
                      src={character.url}
                      alt=""
                      className="w-80 h-60 rounded-md flex justify-center"
                    />
                  </div>

                  <p className="text-center text-2xl bg-white rounded-md">
                    {character.name}
                  </p>
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
              navigate("/detail", { state: { id: 1 } });
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
