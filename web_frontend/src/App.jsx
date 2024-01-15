import {BrowserRouter, Routes} from 'react-router-dom';
function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>{/* <Route element={<HomePage />} path="/" /> */}</Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
