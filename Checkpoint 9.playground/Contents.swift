import UIKit

var greeting = "Hello, Checkpointn 9"

/// Your challenge is this: write a function that accepts an optional array of integers, and returns one
/// randomly. if the array is missing or empty, return a random number in the range 1 through 100.

func getNumber(_ numbers: [Int]?) -> Int {
	return numbers?.randomElement() ?? Int.random(in: 1...100)
}

print(getNumber(nil))

