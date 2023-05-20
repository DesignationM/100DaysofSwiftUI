import UIKit

var greeting = "Hello, playground"

/// The challenge is this: write a function that accepts an integer from 1through 10_000, and returns the
/// integer square root of that number.

enum Checkpoint4Error: Error {
	case outOfBounds
	case noRoot
}

func showIntegerSquareRoot(_ number: Int) throws -> Int {
	if number < 1 || number > 10000{
		throw Checkpoint4Error.outOfBounds
	}
	
	for sqrt in 1...100 {
		if sqrt * sqrt == number {
			return sqrt
		}
	}
	throw Checkpoint4Error.noRoot
}

try showIntegerSquareRoot(2500)



/// Checkpoint5

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let result = luckyNumbers.filter { !$0.isMultiple(of: 2)}.sorted().map {
	print("\($0) is a lucky number")
}
