import React from 'react'
import './index.css'
import BarChartCustom from '../BarChart'
const Panel = ({activeMainTab}) => {

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
    <div> <BarChartCustom data={data}/></div>
  )
}

export default Panel