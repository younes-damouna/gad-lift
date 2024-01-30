import React, { useEffect, useState } from "react";
import { request } from "../../helpers/api";

const FamiliesTable = () => {
  const [families, setfamilies] = useState([]);
  const getUsers = async () => {
    try {
      const response = await request({
        route: "families",
      });
      setfamilies(response);
    } catch (error) {
      console.log(error);
    }
  };
  useEffect(() => {
    getUsers();
  }, []);

  return (
    <div className="table-container">
      <table>
        <thead>
          <tr>
            <th>Family Code</th>
            <th>Parent</th>
            <th>Requests</th>
            <th>Members</th>
            <th>Floor</th>
          </tr>
        </thead>
        <tbody>
          {Array.isArray(families)
            ? families.map((family, index) => {
                return (
                  <tr key={index}>
                    <td> {family.code}</td>
                    <td>
                      {" "}
                      {family.parent.first_name} {family.parent.last_name}
                    </td>
                    <td>
                      {Array.isArray(family.requests) && family.requests.length>0
                        ? family.requests.map((user) => {
                            return (
                              <tr>{`${user.first_name} ${user.last_name}`}</tr>
                            );
                          })
                        : 0}
                    </td>
                    <td>
                      {Array.isArray(family.members) && family.members.length>0
                        ? family.members.map((user) => {
                            return (
                              <tr>{`${user.first_name} ${user.last_name}`}</tr>
                            );
                          })
                        : 0}
                    </td>
                    <td>{family.floor>0? family.floor: '-'}</td>
                  </tr>
                );
              })
            : ""}
        </tbody>
      </table>
    </div>
  );
};

export default FamiliesTable;
