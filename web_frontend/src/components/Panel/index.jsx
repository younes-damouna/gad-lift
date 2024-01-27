import React, { useState } from "react";
import "./index.css";
import BarChartCustom from "../BarChart";
const Panel = ({ activeMainTab,toggleMenu,open }) => {
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
        <div
          class={`burger-menu  ${open?'open':''}`}
          onClick={
           toggleMenu
          }
        >
          <div class="burger-item"></div>
        </div>
      </div>
      {activeMainTab == "Dashboard" ? (
        <BarChartCustom data={data} />
      ) : (
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
              {Array.isArray(users)
                ? users.map((user, index) => {
                    return (
                      <tr key={index}>
                        <td>
                          `{user.first_name} {user.last_name}`
                        </td>
                        <td>{user.phone_number}</td>
                        <td>{user.email}</td>
                      </tr>
                    );
                  })
                : ""}
            </tbody>
          </table>
        </div>
      )}
    </div>
  );
};

export default Panel;
