import '../../assets/css/recipes/recipes.css';
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
    <div className="mx-10">
      <p className="text-center text-2xl my-10">リスト一覧</p>
      <div className="grid grid-cols-4 place-items-center justify-items-center gap-5">
        {sampleRecipes.map((recipe) => {
          return <Recipe key={recipe.id} data={recipe} />;
        })}
      </div>
    </div>
  );
};
