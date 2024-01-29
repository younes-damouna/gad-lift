import { BrowserRouter, Route, Routes } from "react-router-dom";
import LandingPage from "./pages/Landing";
import Navbar from "./components/Navbar";
import "./styles/utilities.css";
import LoginPage from "./pages/Auth/Login";
import DashboardPage from "./pages/Dashboard";
function App() {
  return (
    <div className="">
      <BrowserRouter>
      
        <Routes>
          <Route element={<LoginPage />} path="/auth/login" />
          <Route element={<DashboardPage />} path="/dashboard" />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
