// absurdBubbleSort

function bubbleSort(arr) {
    let sorted = false;
    while(!sorted) {
        sorted = true
        for(let i = 0; i < arr.length - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                sorted = false
                let x = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = x;
            }
        }
    }
    return arr
};

// let arr1 = [9,3,7,2,1]
// console.log(bubbleSort(arr1));

 for(let i = 10; i >=0; i--) {
     console.log(i); 
 }

// def bubble_sort(arr) 
//     sorted = false 

//     until sorted 
//         sorted = true 

//         (0...arr.length - 1).each do |i| 
//             if arr[i] > arr[i + 1] 
//                 arr[i], arr[i + 1] = arr[i +1], arr[i] 
//                 sorited = false 
//             end
//         end
//     end
//     arr 
// end