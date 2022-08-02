import { useState } from 'react';
import reactLogo from '../assets/react.svg';
import { Sidebar } from './layouts/Sidebar';
import '../App.css';

function Home() {
  return (
    <div>
      <Sidebar />
      <h1>Home</h1>
    </div>
  );
}

export default Home;
