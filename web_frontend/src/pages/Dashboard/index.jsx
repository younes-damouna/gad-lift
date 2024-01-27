import React from "react";

import "./index.css";
import BarChart from "../../components/BarChart";
import BarChartCustom from "../../components/BarChart";
const DashboardPage = () => {
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
    <div>
      DashboardPage
    <BarChartCustom data={data}/>
    </div>
  );
};

export default DashboardPage;
