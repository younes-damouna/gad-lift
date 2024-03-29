import React, { useState } from "react";
import "./index.css";
import BarChartCustom from "../BarChart";
import UserTable from "../UsersTable";
import FamiliesTable from "../FamiliesTable";
import DevicesTable from "../DevicesTable";
import AddDeviceForm from "../AddDeviceForm";
const Panel = ({ activeMainTab, toggleMenu, open }) => {
  const [users, setusers] = useState([]);

  const data = [
    {
      name: "Families",
      value: 5,
    },
    {
      name: "Users",
      value: 10,
    },
    {
      name: "Devices",
      value: 3,
    },
  ];

  return (
    <div className="panel w-100">
      <div className="d-flex  menu-container space-between">
        <div className="panel-title"> {activeMainTab}</div>
        <div class={`burger-menu  ${open ? "open" : ""}`} onClick={toggleMenu}>
          <div class="burger-item"></div>
        </div>
      </div>
      {activeMainTab == "Dashboard" ? (
        <BarChartCustom data={data} />
      ) : activeMainTab == "Users" ? (
        <UserTable />
      ) : activeMainTab == "Families" ? (
        <FamiliesTable  />
      ) :activeMainTab == "Devices" ? (
        <DevicesTable/>
      ) : (
        <div >
        <AddDeviceForm className={`w-100 `}/>
  
        </div>
      )}
    </div>
  );
};

export default Panel;
