import React, { useState, useMemo, useRef } from "react";
import TinderCard from "react-tinder-card";
import "../assets/css/swipe.css";
import { recipeList } from "../lib/api.jsx";

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
const db = [
  {
    id: 0,
    name: "豚の生姜焼き",
    url: "./img/meat.jpg",
  },
  {
    id: 1,
    name: "シャケのムニエル",
    url: "./img/fish.jpg",
  },
  {
    id: 2,
    name: "奉天層の肉巻き",
    url: "./img/vegetable.jpg",
  },
];

function Swipe() {
  const [currentIndex, setCurrentIndex] = useState(db.length - 1);
  const [lastDirection, setLastDirection] = useState();
  const currentIndexRef = useRef(currentIndex);

  const childRefs = useMemo(
    () =>
      Array(db.length)
        .fill(0)
        .map((i) => React.createRef()),
    []
  );

  const updateCurrentIndex = (val) => {
    setCurrentIndex(val);
    currentIndexRef.current = val;
  };

  const canGoBack = currentIndex < db.length - 1;

  const canSwipe = currentIndex >= 0;

  // set last direction and decrease current index
  const swiped = (direction, nameToDelete, index) => {
    setLastDirection(direction);
    updateCurrentIndex(index - 1);
  };

  const outOfFrame = (name, idx) => {
    console.log(`${name} (${idx}) left the screen!`, currentIndexRef.current);
    // handle the case in which go back is pressed before card goes outOfFrame
    currentIndexRef.current >= idx && childRefs[idx].current.restoreCard();
    // TODO: when quickly swipe and restore multiple times the same card,
    // it happens multiple outOfFrame events are queued and the card disappear
    // during latest swipes. Only the last outOfFrame event should be considered valid
  };

  const swipe = async (dir) => {
    if (canSwipe && currentIndex < db.length) {
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

  return (
    <div>
      <div className="back-gradation absolute top-0 right-0"></div>
      <div className="shadow-2xl pb-10 absolute bg-white swiper-container rounded-md">
        <div className="grid grid-cols-1 relative my-40">
          <div className="">
            {db.map((character, index) => (
              <TinderCard
                ref={childRefs[index]}
                key={character.name}
                onSwipe={(dir) => swiped(dir, character.name, index)}
                onCardLeftScreen={() => outOfFrame(character.name, index)}
              >
                <div className="absolute swiper">
                  <img
                    src={character.url}
                    alt=""
                    className="w-80 h-60 rounded-md"
                  />
                  <p className="text-center text-2xl bg-white">
                    {character.name}
                  </p>
                </div>
              </TinderCard>
            ))}
          </div>
        </div>
        <div className=" grid grid-cols-3 mx-10 gap-10">
          <button className="shadow-lg py-5" onClick={() => swipe("left")}>
            作らない
          </button>
          <button className="shadow-lg py-5" onClick={() => goBack()}>
            リストに追加する
          </button>
          <button className="shadow-lg py-5" onClick={() => swipe("right")}>
            作る
          </button>
        </div>
      </div>
    </div>
  );
}
export default Swipe;
