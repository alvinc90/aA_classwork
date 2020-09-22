// Write a sum function that takes any number of arguments:

//args
// no explicit parameter name needed
function sum(){
    // console.log(Array.from(arguments))
    let nums = Array.from(arguments)

    // console.log(nums)
    let total = 0;
    for(let i =0; i<nums.length; i++){
        total += nums[i]
    }

    return total;
}

//...
//rest operators need to be in parameter
function sum(...args){
    // console.log(args)
    // let nums = args; 
    let total = 0; 
    for(let i = 0; i < args.length; i++) {
        total += args[i] 
    }
    return total; 
}

// console.log(sum(1, 2, 3, 4) === 10)
// console.log(sum(1, 2, 3, 4, 5) === 15)

// Solve it first using the arguments keyword, then rewrite your solution to use the ...rest operator.
// arguments is an Array - like object accessible inside functions that contains the values of the arguments passed to that function.


// -----------------------------------------

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

//Function#myBind
Function.prototype.myBind = function(context){
    // console.log(context)
    // console.log(this)

    let args = Array.from(arguments).slice(1)
    let says = this
    // says.call(something, args[0],args[1]);
    // says.apply(context, args)
    return function() {
        let args2 = Array.from(arguments)

        // console.log(args2)
        says.apply(context, args.concat(args2))

        //call uses comma separated
        // says.call(context, ...args.concat(args2))

        // console.log(context)  still dog instance

        ///this is crazy dont use it
        // console.log(this)
    };
};
const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

// console.log(markov.says("meow", "Ned"));
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"

//markov.says.myBind(pavlov).anonymous("meow", "a tree")
// markov.says.myBind(pavlov)("meow", "a tree");
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


// ------------------------------------------------------------


// sumThree(4, 20, 6); // == 30






// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30

function curriedSum(target){
    // 1. num target
    // 2. array of nums\
    let numbers = []
    return function _curriedSum(num){
        numbers.push(num)

        if(numbers.length === target){
            return sum(...numbers)
        }else{
            return _curriedSum
        }
    }
}

const total = curriedSum(4);
// console.log(total(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs){
    console.log(this)
    let contextFunction = this
    let numbers = []
    return function _curry(arg){
        numbers.push(arg)
        if (numbers.length === numArgs) {
            // console.log(this)
            console.log(numbers)
            return contextFunction.apply({}, numbers)
        } else {
            //call itself
            return _curry
        }
    }
    
}

function sumThree(nums) {
    console.log(nums)
    //maybe we just ignore this LOL
    nums = Array.from(nums).slice(1)
    return sum(...nums);
}
function multiplyAll(nums){
    return nums
}



console.log(sumThree.curry(4)(5)(30)(20)(1))
