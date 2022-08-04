import '../../assets/css/recipes/recipeDetail.css';
import { Recipe } from './Recipe';

export const Recipes = () => {
  const sampleRecipes = [
    {
      id: 0,
      name: 'tekitou',
      image: 'https://picsum.photos/seed/picsum/600/600',
    },
    {
      id: 1,
      name: 'tekitou',
      image: 'https://picsum.photos/seed/picsum/600/600',
    },
    {
      id: 2,
      name: 'tekitou',
      image: 'https://picsum.photos/seed/picsum/600/600',
    },
    {
      id: 3,
      name: 'tekitou',
      image: 'https://picsum.photos/seed/picsum/600/600',
    },
    {
      id: 4,
      name: 'tekitou',
      image: 'https://picsum.photos/seed/picsum/600/600',
    },
  ];
  return (
    <div className="back-gradation-for-detail">
      <p className="text-center text-2xl py-10">リスト一覧</p>
      <div className="grid md:grid-cols-4 grid-cols-2 place-items-center justify-items-center gap-5 md:px-20 px-5">
        {sampleRecipes.map((recipe) => {
          return <Recipe key={recipe.id} data={recipe} />;
        })}
      </div>
    </div>
  );
};
