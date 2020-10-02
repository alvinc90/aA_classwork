

export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS, 
        todos: {
            1: {
                id: 1,
                title: 'wash car',
                body: 'with soap',
                done: false
            },
            2: {
                id: 2,
                title: 'wash dog',
                body: 'with shampoo',
                done: true
            },
        }
    }
}

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo: {
            id: 1,
            title: 'wash car',
            body: 'with soap',
            done: false
        }
    }
}
// actions.js
const addOrange = {
    type: "ADD_FRUIT",
    fruit: "orange"
  };
// export const receiveTodos = {
//     type: receiveTodos, 
    todos: {
        1: {
            id: 1,
            title: 'wash car',
            body: 'with soap',
            done: false
        },
        2: {
            id: 2,
            title: 'wash dog',
            body: 'with shampoo',
            done: true
        },
    }
// }

// export const receiveTodo = {
//     type: receiveTodo, 
//     todo: {
//         1: {
//             id: 1,
//             title: 'wash car',
//             body: 'with soap',
//             done: false
//         },
//         2: {
//             id: 2,
//             title: 'wash dog',
//             body: 'with shampoo',
//             done: true
//         },
//     }

// }


// export const RECEIVE_SHIRT = "RECEIVE_SHIRT";

// //action
// export const addButtonUp = { //this entire object is an action
//     //we need this type key
//     type: RECEIVE_SHIRT,
//     shirt: {
//         id: 1, //these will come from database but for now we are putting it in
//         style: "button up",
//         price: "25.00"
//     }
// }

// //action creator
// export const receiveShirt = (shirt) => { // function where we are creating actions
//     return {
//         type: RECEIVE_SHIRT,
//         // shirt: shirt // perfectly fine BUT...
//         shirt // dis line, line 20, does ^ short hand notation
//     }
// }
