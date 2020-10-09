//to keep track of our current user.

import {
    RECEIVE_CURRENT_USER,
    LOGOUT_CURRENT_USER
} from '../actions/session_actions'; 

const defaultState = { id: null }

const sessionReducer = (state = defaultState, action) => {
  Object.freeze(state);

  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      // return { id: action.currentUser.id }
        return Object.assign({}, { id: action.currentUser.id });
    case LOGOUT_CURRENT_USER:
      return defaultState;
    default:
      return state;
  }
}
export default sessionReducer;


// {
//   entities: {
//     users: {}
//   },


//   session: {
//     id: null,
//   },


//   errors: {
//     session: ["Invalid credentials"]
//   }
// }