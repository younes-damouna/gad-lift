import React, { useState } from 'react'
import './index.css'
import BarChartCustom from '../BarChart'
const Panel = ({activeMainTab}) => {
    const [users, setusers] = useState([]);

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
    <div className='panel w-100'> 
  <div className="panel-title">   {activeMainTab}</div>
    {activeMainTab=="Dashboard"?
     <BarChartCustom data={data}/>:<></>
    
    }
      <div className="table-container">
          <table>
            <thead>
              <tr>
              <th>Profile Image</th>

                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
             
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              {Array.isArray(users)?users.map((user, index) => {
                return (
                  <tr key={index}>
                    <td>`{user.first_name} {user.last_name}`</td>
                    <td>{user.phone_number}</td>
                    <td>{user.email}</td>
                  
                  </tr>
                );
              }):""}
            </tbody>
          </table>
        </div>
    {/* <BarChartCustom data={data}/> */}
    </div>

  )
}

export default Panel