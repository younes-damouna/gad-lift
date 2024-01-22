import React from "react";
import "./index.css";
import logo from "../../assets/images/AnimatedLogo4.png";
import { Link } from "react-router-dom";
const Navbar = () => {
  return (
    <div className="d-flex space-between bg-white navbar ">
      <Link to={"/"}>
        <div className="logo-container">
          <img className="logo" src={logo} alt="" />
        </div>
      </Link>
      <div className="d-flex gap w-50">
        <div>
          <Link>Home</Link>
        </div>
        <div>
          <Link>About</Link>
        </div>
        {/* <div>
          <Link to={"#home"}>Home</Link>
        </div>
        <div>
          <Link>Home</Link>
        </div> */}
      </div>
    </div>
  );
};

export default Navbar;
