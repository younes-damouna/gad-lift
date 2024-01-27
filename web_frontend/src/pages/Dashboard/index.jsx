import React, { useState } from "react";

import "./index.css";
import BarChart from "../../components/BarChart";
import BarChartCustom from "../../components/BarChart";
const DashboardPage = () => {
  const [activeMainTab,setActiveMainTab]=useState("Dashboard")

  const menuItems=[
    {
      title:"Dashboard"
  },
    {
        title:"Users"
    },
    {
        title:"Families"
    },
    {
        title:"Devices"
    },
   
]
  const data = [
    {
      name: "Families",
      "Families": 5,
      
    },
    {
      name: "Users",
      "Users": 10,
    
    },
    {
      name: "Devices",
      "Devices": 3,
    
    },
  ];

  return (
    <div className="d-flex gap w-100 main">
      <div className="aside">
          <div className="menu">
            {menuItems.map((menuItem,index)=>{return(
            <div key={index} onClick={()=>{ setActiveMainTab(`${menuItem.title}`)}} className={`menu-item ${activeMainTab===menuItem.title?'active':''}`}>{menuItem.title}</div>

            )})}
          
          </div>
        </div>
      DashboardPage
    <BarChartCustom data={data}/>
    </div>
  );
};

export default DashboardPage;
