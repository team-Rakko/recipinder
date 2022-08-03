import '../../assets/css/menu.css';
import meat from '../../assets/images/meat.svg';
import fish from '../../assets/images/fish.svg';
import other from '../../assets/images/other.svg';
import vege from '../../assets/images/vege.svg';
export const Menu = ({ hover }) => {
  return (
    <div
      className={`text-black bg-white absolute p-10 top-5 rounded-lg req-animation ${hover} z-10`}
    >
      <div>
        <div className="grid sm:grid-cols-4 grid-cols-1">
          <div className=" flex items-center justify-center hover:opacity-50">
            <img src={meat} alt="" className="w-8 h-8" />
            <p className="mx-2">肉料理</p>
          </div>
          <div className=" flex items-center justify-center hover:opacity-50">
            <img src={fish} alt="" className="w-8 h-8" />
            <p className="mx-2">魚料理</p>
          </div>
          <div className=" flex items-center justify-center hover:opacity-50">
            <img src={vege} alt="" className="w-8 h-8" />
            <p className="mx-2">野菜料理</p>
          </div>
          <div className=" flex items-center justify-center hover:opacity-50">
            <img src={other} alt="" className="w-8 h-8" />
            <p className="mx-2">その他の料理</p>
          </div>
        </div>
      </div>
    </div>
  );
};
