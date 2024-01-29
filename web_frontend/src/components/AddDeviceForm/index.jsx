import React, { useState } from "react";
import FormGroup from "../../components/FormGroup";
import { useNavigate } from "react-router-dom";
import PrimaryButton from "../../components/PrimaryButton";
import { request } from "../../helpers/api";

const AddDeviceForm = () => {
  const navigate = useNavigate();
  const [message, setMessage] = useState("");
  const [formErrorMessage, setFormErrorMessage] = useState({
    email: "",
    password: "",
  });

  const [form, setForm] = useState({
    email: "",
    password: "",
  });

  const handleForm = (field, value) => {
    setForm((prev) => {
      return {
        ...prev,
        [field]: value,
      };
    });
    if (value == "")
      setFormErrorMessage((prev) => {
        return { ...prev, [field]: `${field} required` };
      });
    else setFormErrorMessage({});
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    const response = await request({
      body: form,
      route: "devices",
      method: "POST",
      isLogin: true,
    });
    console.log(response);
    if (response.statusCode === 200) {
      console.log(response);
    } else {
      setMessage(response.message);
      console.log(response);
    }
  };

  return (
    <div className={`d-flex   `}>
      <div className="form">
        <h2 className="text-center bold ">Add Device</h2>
        <form action="" onSubmit={(e) => handleSubmit(e)}>
          <div className="text-center p-2 text-danger"> {message}</div>
         
            <FormGroup
              label="Mac Address	"
              name="mac_address"
              placeholder="Mac Address	"
              type="text"
              required={true}
              //  value={form.email}
              onChange={handleForm}
            />

            {formErrorMessage.email && (
              <h5 className="text-danger">Mac Address required</h5>
            )}
          
          <FormGroup
            label="IP Address	"
            name="ip_address"
            type="text"
            placeholder={"IP Address"}
            onChange={handleForm}
          />
          {formErrorMessage.password && (
            <h5 className="text-danger">Password required</h5>
          )}

          <FormGroup
            label="Building"
            name="building"
            type="text"
            placeholder={"Building"}
            required={true}
            onChange={handleForm}
          />
          {formErrorMessage.password && (
            <h5 className="text-danger">Password required</h5>
          )}
          
          

          <PrimaryButton
            text={"Submit"}
            className={"primary-btn primary-bg text-center fs-sm"}
            onClick={() => {}}
            type="submit"
          />
        </form>
      </div>
    </div>
  );
};

export default AddDeviceForm;
