import {receiveTodos} from "../actions/todo_actions"
import {receiveTodo} from "../actions/todo_actions"
debugger
const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

export const todosReducer = (state = initialState, action) => {
    const nextState = Object.assign({}, state);
    // Object.freeze(state);
    switch (action.type) {
        case "RECEIVE_TODOS":
             for(const id in action.todos){
                nextState[id] = action.todos[id]
            }
            return nextState
        case "RECEIVE_TODO":
            nextState[action.todo.id] = action.todo
            return
        default:
            return nextState; 
    }
}


 // makes us a copy of state 
  //nextState is just an object {}
  //state is also just an object {} 
  //({} fusing with state)

//     switch (action.type) { // dis be a fancy if else
//         case RECEIVE_ALL_SHIRTS:
//             debugger
//             action.shirts.forEach((shirt) => nextState[shirt.id] = shirt);
//             return nextState
//         case RECEIVE_SHIRT:
//             debugger
//             nextState[action.shirt.id] = action.shirt;
//             // ^^ nextState:{
//             //     action.shirt.id: action.shirt
//             //    }
//             return nextState
//         default:
//             return state;
//     }
// }

// {
//     1: {
//       id: 1,
//       title: 'wash car',
//       body: 'with soap',
//       done: false
//     },
//     2: {
//       id: 2,
//       title: 'wash dog',
//       body: 'with shampoo',
//       done: true
//     },
//   }