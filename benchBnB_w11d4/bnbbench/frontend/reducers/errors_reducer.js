import { combineReducers } from 'redux';
import sessionErrorsReducer from  './session_errors_reducer'

const errorsReducer = combineReducers({
    session: sessionErrorsReducer
});

export default errorsReducer;


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
