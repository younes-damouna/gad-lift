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
const BarChartCustom = ({ data }) => {
  return (
    <div className="w-100">
      <ResponsiveContainer
       
       
        height={250}
        className={`w-100 `}
        margin={{ left: 0 }}
      >
        <BarChart data={data} margin={{ left: 0 }}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis width={0} margin={0} dataKey="name" />
          <YAxis />
          <Tooltip />
          {/* <Legend/> */}
          <Bar
            barCategoryGap={0}
            isAnimationActive={true}
            dataKey="value"
            fill="#2fe2bb"
          />
        </BarChart>
      </ResponsiveContainer>
    </div>
  );
};

export default BarChartCustom;
