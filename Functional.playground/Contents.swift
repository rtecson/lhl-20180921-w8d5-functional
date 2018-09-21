import UIKit

let data = [1, 5, 7, 3, 0, 10, 9, 1]

// Imperitive max finding
var greatest = -9999
for x in data {
    if x > greatest {
        greatest = x
    }
}
print("imperative greatest value is \(greatest)")


// more functional approach
let biggestFunc = data.reduce(-9999, max)
print("functional greatest is \(biggestFunc)")

// what does reduce look like?
func ourReduce<T, V>(coll: [T], initial: V, f: ((V, T) -> V)) -> V {
    if coll.count == 0 {
        return initial
    }
    return ourReduce(coll: Array<T>(coll.dropFirst()),
                     initial: f(initial, coll[0]),
                     f:f)
}

print("greatest again \(ourReduce(coll: data, initial: -9999, f: max))")
//
let maxLen = ourReduce(coll: ["foo", "bar", "quux"],
                       initial: 0,
                       f: { (len, s) in max(len, s.count) })
print("longest string length is \(maxLen)")

func tee<T>(x: T) -> T {
    print("\(x)")
    return x
}

let powers = [1, 2, 3, 4, 5].map { x in pow(x, 2) }
print("powers \(powers)")

let foo = ["aoeu", "foo", "bar"]            // start with array of strings
    .map({ (s: String) in s.count })          // new array of the count of each string
    .map({ (c: Int) in pow(Decimal(c), 2) })  // raise the count of each string to the power of 2
    .filter({ (n: Decimal) in n < 10 })       // only keep the count^2 that are less than 10
    .reduce(0, +)                             // sum the count^2

print("foo = \(foo)")

// swift is not "pure" functional; we can see here that because a
// block can mutate data, the map function is "impure" here -- we can
// see that it in fact must call the block/closure/function on each
// element in order
var count = 0
let aoeu = [1,1,1,1,1].map({x  -> Int in count += 1; return x + count})
print("\(aoeu)")
