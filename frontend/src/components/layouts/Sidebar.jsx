import House from '../../assets/house.svg';
import Search from '../../assets/search.svg';
import { useState } from 'react';
export const Sidebar = () => {
  const [hover, setHover] = useState(false);
  return (
    <div
      className="bg-white grid sm:grid-cols-1 grid-cols-2 absolute sm:gap-10 gap-10 sm:py-10 py-3 sm:px-3 px-10 place-items-center justify-items-center rounded-lg top-5 left-5"
      onMouseLeave={() => {
        setHover(false);
      }}
    >
      <img src={House} alt="" className="w-8 h-8" />
      <img
        src={Search}
        alt=""
        className="w-8 h-8"
        onMouseEnter={() => {
          setHover(true);
        }}
      />
      {hover && alert('hover')}
    </div>
  );
};
