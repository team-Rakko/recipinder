import React from 'react';
import '../assets/css/modal.css';

export const ConfirmationModal = ({ setModal }) => {
  return (
    <div className="bg-white grid grid-cols-1 z-50 p-10 modal place-items-center justify-items-center rounded-md">
      <p className="text-center">レシピを確認しますか？</p>
      <div className="grid grid-cols-2 gap-10">
        <button className="shadow-lg py-2 px-4 button rounded-md">する</button>
        <button
          className="shadow-lg py-2 px-4 button rounded-md"
          onClick={() => {
            setModal(false);
          }}
        >
          しない
        </button>
      </div>
    </div>
  );
};
