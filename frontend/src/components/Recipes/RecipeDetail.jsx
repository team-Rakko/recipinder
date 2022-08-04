import { useLocalStorage } from '../../hooks/useLocalStorage.js';
import { useEffect } from 'react';
import '../../assets/css/recipes/recipeDetail.css';
export const RecipeDetail = () => {
  // recipe情報はこのページに遷移するときにlocalstorageに保存してlocalstorageから参照する
  //   ここからテスト用
  const [recipe, setRecipe] = useLocalStorage('name', 'initialValue');
  useEffect(() => {
    setRecipe({
      name: 'niku',
      description: '食ってみな飛ぶぞ',
      url: 'https://image.delishkitchen.tv/recipe/233971595058610622/1.webp?version=1658215376&w=600',
      place: 500,
      ingredients: '鶏モモ肉,卵',
      evaluation: 3,
    });
  }, []);
  const procedure = [
    '肉を焼く',
    '肉に胡椒をかける',
    '出来上がり',
    'お皿の用意',
    '食べる',
  ];
  return (
    <div className="back-gradation-for-detail py-10">
      <div className=" bg-white place-items-center justify-items-center shadow-lg rounded-md lg:mx-52 mx-10">
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
            <p>{recipe.ingredients}</p>
          </div>
        </div>
        <div className="border-y-4 py-3 my-3">
          <p className="flex justify-center text-2xl">{recipe.name}</p>
          <p className="flex justify-center">{recipe.place}円</p>
        </div>

        <div className="grid md:grid-cols-3 grid-cols-1 gap-5 px-10">
          {procedure.map((p, index) => {
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
