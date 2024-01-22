import {BrowserRouter, Route, Routes} from 'react-router-dom';
import LandingPage from './pages/Landing';
import Navbar from './components/Navbar';
import './styles/utilities.css'
import LoginPage from './pages/Auth/Login';
function App() {
  return (
    <div className="container">
      <BrowserRouter>
      <Navbar/>
        <Routes>
          <Route element={<LandingPage />} path="/" />
          <Route element={<LoginPage />} path="/auth/login" />
          </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
