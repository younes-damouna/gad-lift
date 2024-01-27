import React, { useState } from "react";
import "./index.css";
import FormGroup from "../../../components/FormGroup";
import { useNavigate } from "react-router-dom";
import PrimaryButton from "../../../components/PrimaryButton";
import { request } from "../../../helpers/api";
import logo from "./../../../assets/images/AnimatedLogo4.png";

const LoginPage = () => {
  const navigate = useNavigate();
  const [message, setMessage] = useState("");
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
  };
  const handleSubmit = async (e) => {
    e.preventDefault();
    const response = await request({
      body: form,
      route: "auth/login",
      method: "POST",
      isLogin: true,
    });
    console.log(response);
    if (response.statusCode === 200) {
      console.log(response);
      localStorage.setItem("logged_in", JSON.stringify(response.access_token));
      navigate("/dashboard");
    } else {
      setMessage(response.message);
      console.log(response);
    }
  };

  return (
    <div className=" d-flex center  full-height">
      <div className="form">
        <img src={logo} alt=""  className="w-100"/>
        <h2 className="text-center bold p-2">Welcome Again</h2>
        <form action="" onSubmit={(e) => handleSubmit(e)}>
          <div className="text-center p-2 text-danger"> {message}</div>
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
            onClick={() => {}}
            type="submit"
          />
        </form>
      </div>
    </div>
  );
};

export default LoginPage;
