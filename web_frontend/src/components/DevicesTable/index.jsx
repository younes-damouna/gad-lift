import React, { useEffect, useState } from 'react'
import { request } from '../../helpers/api';

const DevicesTable = () => {
    const [devices, setDevices] = useState([]);
    useEffect(() => {
      const getDevices = async () => {
        try {
          const response = await request({
            route: "devices",
          });
          setDevices(response);
        } catch (error) {
          console.log(error);
        }
      };
      getDevices();
    }, []);

  return (
    <div className="table-container">
      <table>
        <thead>
          <tr>
            <th>Mac Address</th>
            <th>IP Address</th>
            <th>Building</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          {Array.isArray(devices)
            ? devices.map((device, index) => {
                return (
                  <tr key={index}>
                    <td>
                      {device.mac_address} 
                    </td>{" "}
                    <td>{device.ip_address}</td>
                    <td>{device.building}</td>
                    <td>{device.status}</td>

                  </tr>
                );
              })
            : ""}
        </tbody>
      </table>
    </div>
  )
}

export default DevicesTable