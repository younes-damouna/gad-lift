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
    <div>
     
      <ResponsiveContainer width={700} height={250}>
        <BarChart data={data}>
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
