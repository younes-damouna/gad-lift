import React, { useState } from "react";
import "./index.css";
import FormGroup from "../../../components/FormGroup";
import { useNavigate } from "react-router-dom";
import PrimaryButton from "../../../components/PrimaryButton";
import { request } from "../../../helpers/api";
const LoginPage = () => {
  const navigate = useNavigate();
  const [message,setMessage]=useState('');
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
  const handleSubmit = async () => {
    const response = await request({
      body: form,
      route: "auth/login",
      method: "POST",
      isLogin:true
    });
    console.log(response);
    if (response.statusCode === 200) {
      console.log(response);
      localStorage.setItem("logged_in", JSON.stringify(response.access_token));

    }else{

    }

  };

  return (
    <div className=" d-flex center  full-height">
      <div className="form">
        <h2 className="text-center bold">Welcome Again</h2>
        <form action="" onSubmit={() => handleSubmit()} method="post">
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
