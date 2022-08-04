// Hook
import { useState } from 'react';
export const useLocalStorage = (key, initialValue) => {
  // 値をstateで一旦保持する、ただuseStateは一回しか使われない
  const [storedValue, setStoredValue] = useState(() => {
    // undefinedの場合はinitialValueに
    if (typeof window === 'undefined') {
      return initialValue;
    }

    try {
      // localStorageの値をとってくる。itemがあればjson形式に
      const item = window.localStorage.getItem(key);
      return item ? JSON.parse(item) : initialValue;
    } catch (error) {
      console.log(error);
      return initialValue;
    }
  });
  // localstorageに値を代入する
  const setValue = (value) => {
    try {
      // 関数ならvalue関数を実行する、違うならvalueを返す
      const valueToStore =
        value instanceof Function ? value(storedValue) : value;
      // stateの保存
      setStoredValue(valueToStore);
      // localstorageへの保存
      if (typeof window !== 'undefined') {
        window.localStorage.setItem(key, JSON.stringify(valueToStore));
      }
    } catch (error) {
      console.log(error);
    }
  };
  return [storedValue, setValue];
};
