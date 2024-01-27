import React from "react";
import {
    Bar,
    BarChart,
    CartesianGrid,
    Legend,
    ResponsiveContainer,
    Tooltip,
    XAxis,
    YAxis,
  } from "recharts";
const BarChartCustom = ({data}) => {
  return (
    <div className="w-100">
     
      <ResponsiveContainer width={'100%'} height={250} className={`w-100`}
    >
        <BarChart data={data}   margin={{left:0,top:0,left:0,bottom:0}}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Legend />
          <Bar dataKey="Families" fill="#8854d8" />
          <Bar dataKey="Users" fill="#82c69d" />
          <Bar dataKey="Devices" fill="#ff66cc" />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
};

export default BarChartCustom;
