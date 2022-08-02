import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Test from "./components/Test.jsx";
import Home from "./components/Home.jsx";
function App() {
  const root = ReactDOM.createRoot(document.getElementById("root"));
  root.render(
    <BrowserRouter>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/" element={<Home />}></Route>
        <Route path="test" element={<Test />}></Route>
      </Routes>
    </BrowserRouter>
  );
}
export default App;
