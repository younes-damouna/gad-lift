import React, { useEffect, useState } from "react";

import "./index.css";
import logo from "./../../assets/images/AnimatedLogo4.png";

import BarChart from "../../components/BarChart";
import BarChartCustom from "../../components/BarChart";
import Panel from "../../components/Panel";
import { useNavigate } from "react-router-dom";
const DashboardPage = () => {
  const [activeMainTab, setActiveMainTab] = useState("Dashboard");
  const [showMenu, setShowMenu] = useState(false);
  const toggleMenu = () => {
    if (showMenu) setShowMenu(false);
    else setShowMenu(true);
    // alert(showMenu ? "d-none" : "d-flex");
  };
  // when token expires
  setInterval(() => {
    localStorage.removeItem("logged_in");
    navigate("/auth/login");
  }, 1000 * 60 * 60);

  const navigate = useNavigate();
  useEffect(() => {
    if (
      localStorage.getItem("logged_in") === null ||
      localStorage.getItem("logged_in") === ""
    ) {
      navigate("/");
    }
  }, []);
  const menuItems = [
    {
      title: "Dashboard",
    },
    {
      title: "Users",
    },
    {
      title: "Families",
    },
    {
      title: "Devices",
    },
  ];
  const handleLogout = () => {
    localStorage.removeItem("logged-in");
    navigate("/auth/login");
  };

  return (
    <div className="d-flex gap w-100 main">
      <div className={`${showMenu ? "show-menu" : ""} aside`}>
        <div className="menu">
          <img src={logo} className={`w-100`} />

          {menuItems.map((menuItem, index) => {
            return (
              <div
                key={index}
                onClick={() => {
                  setActiveMainTab(`${menuItem.title}`);
                }}
                className={`menu-item ${
                  activeMainTab === menuItem.title ? "active" : ""
                }`}
              >
                {menuItem.title}
              </div>
            );
          })}

          <div className={`menu-item log-out-btn`} onClick={handleLogout}>
            Log Out
          </div>
        </div>
      </div>
      <div className="m-10 w-100">
        <Panel
          activeMainTab={activeMainTab}
          toggleMenu={toggleMenu}
          open={showMenu}
        />
      </div>
    </div>
  );
};

export default DashboardPage;
