import {BrowserRouter, Route, Routes} from 'react-router-dom';
import LandingPage from './pages/Landing';
import Navbar from './components/Navbar';
import './styles/utilities.css'
function App() {
  return (
    <div className="container">
      <BrowserRouter>
      <Navbar/>
        <Routes>
          <Route element={<LandingPage />} path="/" />
          </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
