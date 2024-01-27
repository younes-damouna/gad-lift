import React, { useEffect, useState } from "react";
import { request } from "../../helpers/api";

const UserTable = () => {
  const [users, setusers] = useState([]);
  useEffect(() => {
    const getUsers = async () => {
      try {
        const response = await request({
          route: "users",
        });
        setusers(response);
      } catch (error) {
        console.log(error);
      }
    };
    getUsers();
  }, []);
  console.log(users);
  return (
    <div className="table-container">
      <table>
        <thead>
          <tr>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
          </tr>
        </thead>
        <tbody>
          {Array.isArray(users)
            ? users.map((user, index) => {
                return (
                  <tr key={index}>
                    <td>
                      {user.first_name} {user.last_name}
                    </td>{" "}
                    <td>{user.email}</td>
                    <td>{user.mobile_number}</td>
                  </tr>
                );
              })
            : ""}
        </tbody>
      </table>
    </div>
  );
};

export default UserTable;
