import { useState } from 'react';
import { useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import '../../assets/css/recipes/recipeDetail.css';
import { recipeDetail } from '../../lib/api';
import notImg from '../../assets/images/notImg.jpeg';

export const RecipeDetail = () => {
  const navigate = useNavigate();

  const [recipe, setRecipe] = useState({
    name: 'not found',
    description: '',
    url: notImg, // 灰色の画像をセット
    place: '0',
    ingredients: ['料理が見つかりませんでした'],
    evaluation: '0',
    process: [],
  });

  useEffect(() => {
    // ローカルストレージから取得
    const recipeId = Number(localStorage.getItem('recipeId'));
    if (!recipeId) {
      navigate('/swipe');
    }

    const sendData = {
      id: recipeId,
    };

    recipeDetail(sendData).then((recipeData) => {
      const ingredients = recipeData.data.ingredients.split(',');

      const process = recipeData.data.Process;
      const prosessList = process.map((value) => {
        return value.explanation;
      });

      const recipeDetail = {
        name: recipeData.data.name,
        description: recipeData.data.description,
        url: recipeData.data.url,
        place: recipeData.data.place,
        ingredients: ingredients,
        evaluation: recipeData.data.evaluation,
        process: prosessList,
      };
      setRecipe(recipeDetail);
    });
  }, []);

  return (
    <div className="back-gradation-for-detail py-10">
      <div className=" bg-white place-items-center justify-items-center shadow-lg rounded-md sm:mx-10 lg:mx-52 mx-1">
        <div className="grid md:grid-cols-2 grid-cols-1 place-items-center justify-items-center">
          <div>
            <img
              src={recipe.url}
              alt=""
              className="rounded-md object-cover max-h-92"
            />
          </div>
          <div>
            <p className="flex justify-center text-lg py-5">材料</p>
            <div className="grid grid-cols-2 gap-3">
              {recipe.ingredients.map((value) => (
                <p>・ {value}</p>
              ))}
            </div>
          </div>
        </div>
        <div className="border-y-4 py-3 my-3">
          <p className="flex justify-center text-2xl">{recipe.name}</p>
          <p className="flex justify-center text-2xl">{recipe.place}円</p>
        </div>

        <div className="grid md:grid-cols-3 grid-cols-1 gap-5 px-10">
          {recipe.process.map((p, index) => {
            return (
              <div className="shadow-lg p-5 place-items-center justify-items-center lg:my-8 my-2">
                <p className="text-center border-b-2">手順{index + 1}</p>
                <p className="py-1">{p}</p>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
};
