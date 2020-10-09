import * as APIUtils from '../util/session_api_util';

export const RECEIVE_CURRENT_USER = 'RECEIVE_CURRENT_USER';
export const LOGOUT_CURRENT_USER = 'LOGOUT_CURRENT_USER';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveCurrentUser = (currentUser) => {
  return ({
    type: RECEIVE_CURRENT_USER,
    currentUser
  })
};

export const logoutCurrentUser = () => {
    return ({
        type: LOGOUT_CURRENT_USER
    })
}; 

// errors is an Array
export const receiveErrors = (errors) => {
    return ({
        type: RECEIVE_ERRORS,
        errors 
    })
};


export const login = (user) => dispatch => {
    return (
        APIUtils.signIn(user)
            .then(loggedInUser => dispatch(receiveCurrentUser(loggedInUser)))
            .fail(errors => dispatch(receiveErrors(errors.responseJSON)))
    )
};

export const logout = () => dispatch => {
    return (
        APIUtils.signOut().then(loggedOutUser => dispatch(logoutCurrentUser()))
    )
};

export const signup = (user) => dispatch => {
    return (
        APIUtils.signUp(user)
            .then(signedUpUser => dispatch(receiveCurrentUser(signedUpUser)))
            .fail(errors => dispatch(receiveErrors(errors.responseJSON)))
    )
};

// export const fetchContacts = () => dispatch => (
//   ContactAPIUtil.fetchContacts().then(contacts => dispatch(receiveContacts(contacts)));
// );