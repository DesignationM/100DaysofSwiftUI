import UIKit

var greeting = "Hello, Checkpoint 6"

/// create a struct to store information about a car, including it's model, number of seats and current gear,
/// then add a method to change gears up or down.

struct Car {
	let model: String
	var seats: Int
	private var currentGear: Int = 1
	let topGear: Int
	mutating func upshift() {
		if currentGear < topGear {
			currentGear += 1
		}
	}
	
	mutating func downshift() {
		if currentGear > 1 {
			currentGear -= 1
		}
	}
}
