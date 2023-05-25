import UIKit

var greeting = "Hello, checkpoint 8"

/// Your challenge is this: make a protocol that describes a building, adding various properties
/// and methods, then create two structs, House and Office, that conform to it. Your protocol
/// should require the following:
///
/// 1. A property storing how many rooms it has
/// 2. A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
/// 3. A property storing the sname of the estate agent responsible for selling the building
/// 4. A method for printing the sales summary of the building, describing what it is along with its
/// other properties.


protocol Building {
	var rooms: Int {get set}
	var cost: Int {get set}
	var agent: String {get set}
	func printSalesSummary()
}

struct House: Building {
	var rooms: Int
	
	var cost: Int
	
	var agent: String
	
	func printSalesSummary() {
		print("This location has \(rooms) rooms and costs \(cost). Please contact \(agent) for more information")
	}
}

struct Office: Building {
	var rooms: Int
	
	var cost: Int
	
	var agent: String
	
	func printSalesSummary() {
		print("This location has \(rooms) rooms and costs \(cost). Please contact \(agent) for more information")
	}
}
