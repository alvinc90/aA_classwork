const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
      reader.question ("Enter Number: ", function (numStr){
        const input1 = parseInt(numStr);
        console.log(sum += input1);
        addNumbers(sum, numsLeft - 1, completionCallback ); 
      });
    } else if (numsLeft === 0) {
        completionCallback(sum);
    }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


// reader.question("What is your name?", function (answer) {
    
//   console.log(`Hello ${answer}!`);
// });

// const readline = require('readline');

// const reader = readline.createInterface({
//     input: process.stdin,
//     output: process.stdout
// });

// function addTwoNumbers(callback) {
//     // Notice how nowhere do I return anything here! You never return in
//     // async code. Since the caller will not wait for the result, you
//     // can't return anything to them.

//     reader.question("Enter #1: ", function (numString1) {
//         reader.question("Enter #2: ", function (numString2) {
//             const num1 = parseInt(numString1);
//             const num2 = parseInt(numString2);

//             callback(num1 + num2);
//         });
//     });
// }

// addTwoNumbers(function (result) {
//     console.log(`The result is: ${result}`);
//     reader.close();
// });