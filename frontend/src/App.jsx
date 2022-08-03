import { BrowserRouter, Routes, Route } from 'react-router-dom';
import * as ReactDOM from 'react-dom';
import Test from './components/Test.jsx';
import Home from './components/Home.jsx';
import Login from './components/Login.jsx';
import Swipe from './components/Swipe.jsx';
import './App.css';
function App() {
  // const root = document.getElementById('root');
  // const root = ReactDOM.createRoot(document.getElementById('root'));
  return (
    <BrowserRouter>
      <Routes>
        <Route index element={<Home />} />
        <Route path="/" element={<Home />}></Route>
        <Route path="test" element={<Test />}></Route>
        <Route path="login" element={<Login />}></Route>
        <Route path="swipe" element={<Swipe />}></Route>
      </Routes>
    </BrowserRouter>
  );
}
export default App;
