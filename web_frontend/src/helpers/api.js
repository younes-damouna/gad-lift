import axios from "axios";
axios.defaults.baseURL = "http://localhost:3000";
export const request = async ({ route, method, body, isLogin = false }) => {
   try{
    const response = await axios.request({
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
            'Authorization': isLogin ? '' :`Bearer ${ JSON.parse(localStorage.getItem("logged_in"))}`
        },
        url: route,
        method: method,
        data: body,
    });

    return response.data;
   }
   catch(e){
    console.log('data'+e.response.data);

    return e.response.data;
   }
};
