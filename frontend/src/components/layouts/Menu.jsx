import '../../assets/css/menu.css';
import meat from '../../assets/images/meat.svg';
import fish from '../../assets/images/fish.svg';
import other from '../../assets/images/other.svg';
import vege from '../../assets/images/vege.svg';
import { useNavigate } from 'react-router-dom';
import { recipeList } from '../../lib/api';
import { useEffect, useState } from 'react';
export const Menu = ({ hover }) => {
  const navigate = useNavigate();
  const postSwipeRecipe = (postId) => {
    const datas = recipeList({
      tag: postId,
      id: 0,
    }).then(function (response) {
      return response.data;
    });
    return datas;
  };
  const [items, setItems] = useState(postSwipeRecipe(0));

  return (
    <div
      className={`text-black bg-white absolute p-10 top-5 rounded-lg req-animation ${hover} z-10`}
    >
      <div>
        <div className="grid sm:grid-cols-4 grid-cols-1">
          <button
            onClick={() => {
              postSwipeRecipe(0);
              navigate('/swipe', { state: 'a' });
            }}
            className=" flex items-center justify-center hover:opacity-60"
          >
            <img src={meat} alt="" className="w-8 h-8" />
            <p className="mx-2">肉料理</p>
          </button>
          <button
            onClick={() => {
              navigate('/swipe');
              postSwipeRecipe(2);
            }}
            className=" flex items-center justify-center hover:opacity-60"
          >
            <img src={fish} alt="" className="w-8 h-8" />
            <p className="mx-2">魚料理</p>
          </button>
          <button
            onClick={() => {
              navigate('/swipe');
              postSwipeRecipe(3);
            }}
            className=" flex items-center justify-center hover:opacity-60"
          >
            <img src={vege} alt="" className="w-8 h-8" />
            <p className="mx-2">野菜料理</p>
          </button>
          <button
            onClick={() => {
              navigate('/swipe');
              postSwipeRecipe(1);
            }}
            className=" flex items-center justify-center hover:opacity-60"
          >
            <img src={other} alt="" className="w-8 h-8" />
            <p className="mx-2">その他の料理</p>
          </button>
        </div>
      </div>
    </div>
  );
};
