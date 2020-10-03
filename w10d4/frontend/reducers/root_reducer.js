import {combineReducers} from "redux"; 
import {todosReducer} from "./todos_reducer"; 

todosReducer()
debugger

const rootReducer = combineReducers({
    todos: todosReducer
})


export default rootReducer 

// import { combineReducers } from "redux";
// import shirtsReducer from "./shirt_reducer"

// const rootReducer = combineReducers({
//     shirts: shirtsReducer,
//     // shoes: () => ({}),
//     // jackets: () => ({}),
//     // banana: () => ({})
// })
// export default rootReducer


// root reducer job is to combine all other reducers
// import { combineReducers } from "redux";
// import shirtsReducer from "./shirt_reducer"

// const rootReducer = combineReducers({
//     shirts: shirtsReducer,
//     // shoes: () => ({}),
//     // jackets: () => ({}),
//     // banana: () => ({})
// })