import {
    RECEIVE_ERRORS,
    RECEIVE_CURRENT_USER
} from '../actions/session_actions'


const sessionErrorsReducer = (state = [], action) => {
    Object.freeze(state);

    switch (action.type) {
        case RECEIVE_ERRORS:
            return action.errors;
        case RECEIVE_CURRENT_USER:
            return [];
        default:
            return state;
    }

}

export default sessionErrorsReducer;




//  Our app's state might look something like this:

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
