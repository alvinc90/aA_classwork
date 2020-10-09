
import { combineReducers } from 'redux';
import sessionReducer from './session_reducer'
import errorsReducer from './errors_reducer'
import entitiesReducer from './entities_reducer'

const rootReducer = combineReducers({
  entities: entitiesReducer,
  session: sessionReducer,
  errors: errorsReducer
})

export default rootReducer;




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
