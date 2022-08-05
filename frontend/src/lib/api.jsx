import axios from "axios";

const options = {
  ignoreHeaders: true,
};

const client = axios.create(
  {
    baseURL: "https://recepiender.home.k1h.dev/",
  },
  options
);

export const signUp = (data) => {
  return client.post("sign/up", data);
};

export const recipeList = (data) => {
  return client.post("recipe/list", data);
};

export const recipeDetail = (data) => {
  return client.post("recipe/detail", data);
};

export const list = (data) => {
  return client.post("list", data);
};

export const getlist = (data) => {
  return client.post("list/user", data);
};
