import React, { useState } from "react";
import "./index.css";
import FormGroup from "../../../components/FormGroup";
import { useNavigate } from "react-router-dom";
import PrimaryButton from "../../../components/PrimaryButton";
const LoginPage = ({ switchToRegister }) => {
  const navigate = useNavigate();

  const [form, setForm] = useState({
    role_id: "",
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
  };
  const handleSubmit = async () => {};

  return (
    <div className=" d-flex center  ">
      <div className="form">
        <h2 className="text-center bold">Welcome Again</h2>
        <form action="" method="post">
          <FormGroup
            label="Email"
            name="email"
            placeholder="John.Doe@mail.com"
            type="email"
            required={true}
            //  value={form.email}
            onChange={handleForm}
          />
          <FormGroup
            label="Password"
            name="password"
            type="password"
            placeholder={"********"}
            required={true}
            onChange={handleForm}
          />

          <PrimaryButton
            text={"Log In"}
            className={"primary-btn primary-bg text-center fs-sm"}
            onClick={() => handleSubmit()}
          />
        </form>
      </div>
    </div>
  );
};

export default LoginPage;
