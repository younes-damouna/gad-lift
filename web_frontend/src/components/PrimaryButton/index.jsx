import React from 'react'
import './index.css'
const PrimaryButton = ({text, className,onClick}) => {
    return (
        <div className={`${className} rounded-1 fs-md`} onClick={onClick}>{text}</div>
      )
}

export default PrimaryButton