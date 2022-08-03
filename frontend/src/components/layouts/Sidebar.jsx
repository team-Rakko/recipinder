import House from '../../assets/images/house.svg';
import Search from '../../assets/images/search.svg';
import List from '../../assets/images/list.svg';
import { Menu } from './Menu';
import { useState } from 'react';
import '../../assets/css/menu.css';
export const Sidebar = () => {
  const [hover, setHover] = useState(false);
  const [styles, setStyles] = useState('left-10');
  return (
    <div
      onMouseLeave={() => {
        setHover(false);
        setStyles('left-10 opacity-0');
      }}
    >
      <div className="bg-white grid sm:grid-cols-1 grid-cols-2 absolute sm:gap-10 gap-10 sm:py-10 py-3 sm:px-3 px-10 place-items-center justify-items-center rounded-lg top-5 left-5 z-10">
        <img
          src={Search}
          alt=""
          className="w-8 h-8"
          onMouseEnter={() => {
            setHover(true);
            setTimeout(() => {
              setStyles(
                'left-0 sm:left-20 sm:top-5 top-20 sm:w-3/4 w-full opacity-100'
              );
            }, 20);
          }}
        />
        <img src={House} alt="" className="w-8 h-8" />
        <img src={List} alt="" className="w-8 h-8" />
      </div>
      {hover && <Menu hover={styles} />}
    </div>
  );
};
