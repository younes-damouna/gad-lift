import React from "react";
import "./index.css";
const PrimaryButton = ({ text, className, onClick }) => {
  return (
    <div className={'button-wrapper'}>
        <div className={`${className} button-wrapper rounded-1 fs-md`} onClick={onClick}>{text}</div>
    </div>
  );
};

export default PrimaryButton;
