import UIKit

var str = "Hello, playground"


let myArray = [3, -14, 8, 2, -5]
var tempMax: Int = -Int.max

// Imperative way
func findMax(input: [Int]) {
    for element in input {
        if element > tempMax {
            tempMax = element
        }
    }
}
let foundMax = tempMax


// Functional way
let biggestValue = myArray.reduce(-Int.max, max)
print("functional greatest is \(biggestValue)")



func myRecursiveMax (initialValue: Int, myArray: [Int]) -> Int {
    // Base case
    if myArray.count == 0 {
        return initialValue
    }
    
    let subArray = Array(myArray.dropFirst())
    if initialValue < myArray[0] {
        return myRecursiveMax(initialValue: myArray[0], myArray: subArray)
    }
    else {
        return myRecursiveMax(initialValue: initialValue, myArray: subArray)
    }
}

let newMax = myRecursiveMax(initialValue: -Int.max, myArray: myArray)

let myFunc = { (x: Int) -> Int in
    return x * x
}

let newAnswer = myArray.map(myFunc)
print(newAnswer)

let _ = myArray.map { (x: Int) -> Int in
    return x * x
}

// This is a short-hand for the above
var answer = myArray.map { $0 * $0 }
print(answer)

let _ = myArray.map { $0 - 100 }

let answer2 = myArray.filter { (x: Int) -> Bool in
    return x >= 0
}
print(answer2)

answer = myArray.filter { $0 % 2 == 0 }
print(answer)





// what does reduce look like?
func ourReduce<T, V>(coll: [T], initial: V, f: ((V, T) -> V)) -> V {
    if coll.count == 0 {
        return initial
    }
    return ourReduce(coll: Array<T>(coll.dropFirst()),
                     initial: f(initial, coll[0]),
                     f:f)
}

print("greatest again \(ourReduce(coll: myArray, initial: -Int.max, f: max))")
let floatMax = ourReduce(coll: [0.5, 5.2, -8.0], initial: -Float.greatestFiniteMagnitude, f: max)



let maxLen = ourReduce(coll: ["foo", "baradfasdfafds", "quux"],
                       initial: 0,
                       f: { (len, s) in max(len, s.count) })
print("longest string length is \(maxLen)")





var foo = ["aoeu", "foo", "bar"]              // start with array of strings
    .map({ (s: String) in s.count })          // new array of the count of each string --> [4, 3, 3]
    .map({ (c: Int) in pow(Decimal(c), 2) })  // raise the count of each string to the power of 2 --> [16, 9, 9]
    .filter({ (n: Decimal) in n < 10 })       // only keep the count^2 that are less than 10 --> [9, 9]
    .reduce(0, +)                             // sum the count^2 --> 18

print("foo = \(foo)")

let numberOfLetters = { (s: String) in s.count }
let squareTheNumber = { (c: Int) in pow(Decimal(c), 2) }
let lessThan10 = { (n: Decimal) in n < 10 }

foo = ["aoeu", "foo", "bar"]       // start with array of strings
    .map(numberOfLetters)          // new array of the count of each string --> [4, 3, 3]
    .map(squareTheNumber)          // raise the count of each string to the power of 2 --> [16, 9, 9]
    .filter(lessThan10)            // only keep the count^2 that are less than 10 --> [9, 9]
    .reduce(0, +)                  // sum the count^2 --> 18

print("foo = \(foo)")




// swift is not "pure" functional; we can see here that because a
// block can mutate data, the map function is "impure" here -- we can
// see that it in fact must call the block/closure/function on each
// element in order
var count = 0
let aoeu = [1,1,1,1,1].map({x  -> Int in count += 1; return x + count})
print("\(aoeu)")

