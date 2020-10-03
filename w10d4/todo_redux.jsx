import React from "react"
import ReactDOM from "react-dom"
import configureStore from "./frontend/store/store";

document.addEventListener("DOMContentLoaded", () =>{
    const root = document.getElementById("root")
    ReactDOM.render(<div>REACT WORKING</div>, root)

    window.store = configureStore(); 
})