import { useNavigate } from "react-router-dom";

export const Recipe = ({ data }) => {
  const navigate = useNavigate();

  const showDetail = () => {
    //ローカルストレージにレシピidを保存する処理を書く
    console.log(data.recipe_id);
    /////////

    // 詳細画面に遷移
    navigate("/detail");
  };
  return (
    <div
      className="bg-white text-center shadow-2xl rounded-md"
      onClick={showDetail}
    >
      <img src={data.url} alt="" className="rounded-md image-resize" />
      <p className="py-4">{data.name}</p>
    </div>
  );
};
