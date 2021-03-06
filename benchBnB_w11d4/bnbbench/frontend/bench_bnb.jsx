import React from 'react'; 
import ReactDOM from 'react-dom';
import configureStore from './store/store' 
import {login, logout, signup} from './actions/session_actions'
import Root from './components/root'



//test
import { signIn, signUp, signOut} from './util/session_api_util'

document.addEventListener("DOMContentLoaded" , () => {
    const store = configureStore();
    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root);


    //test
    window.login = login;
    window.logout = logout;
    window.signup = signup;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
}); 