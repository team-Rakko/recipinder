export const Recipe = ({ data }) => {
  console.log(data);
  return (
    <div className="text-center shadow-2xl rounded-md">
      <img src={data.image} alt="" className="rounded-md image-resize" />
      <p className="py-4">{data.name}</p>
    </div>
  );
};
