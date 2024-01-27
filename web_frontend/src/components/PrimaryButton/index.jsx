import React from "react";
import "./index.css";
const PrimaryButton = ({ text, className, onClick ,type}) => {
  return (
    <div className={'button-wrapper'}>
        <button className={`${className} button-wrapper rounded-1 fs-md w-100`} onClick={onClick} type={type}>{text}</button>
    </div>
  );
};

export default PrimaryButton;
