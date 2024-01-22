import {BrowserRouter, Routes} from 'react-router-dom';
import LandingPage from './pages/Landing';
function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route element={<LandingPage />} path="/" />
          </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
