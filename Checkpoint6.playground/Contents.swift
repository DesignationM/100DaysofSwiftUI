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

/// Checkpoint 7
/// Make a class hierarchy for animals, startinng with Animal at the top, then Dog and Cat as Subclasses,
/// then Corgi and Poodle as subclasses of Dog and Persian and Lion as subclasses of cat.
///
/// The Animal class should have a legs integer property
/// The Dog class should have a speak() method that prints a generic dog barking string but each subclass
/// should print something different
/// The Cat class should have a matching speak() method again with each subclass printing something different
/// The Cat class should have an isTame Boolean Property provided using an initializer

class Animal {
	var legs: Int
	init(legs: Int) {
		self.legs = legs
	}
}

class Dog: Animal {
	init() {
		super.init(legs: 4)
	}
	func speak() {
		print("Woof")
	}
}

class Cat: Animal {
	var isTame: Bool
	init(isTame: Bool) {
		self.isTame = isTame
		super.init(legs: 4)
	}
	func speak() {
		print("Meow")
	}
}

class Corgi: Dog {

	override func speak() {
		print("Corgi Woof")
	}
}

class Poodle: Dog {

	override func speak() {
		print("Poodle Woof")
	}
}

class Persian: Cat {
	init() {
		super.init(isTame: true)
	}
	override func speak() {
		print("Persian Meow")
	}
}

class Lion: Cat {
	init() {
		super.init(isTame: false)
	}
	override func speak() {
		print("ROAR!")
	}
}

let lion = Lion()
lion.speak()

let persian = Persian()
persian.speak()

let cat = Cat(isTame: true)
cat.speak()

let corgi = Corgi()
corgi.speak()

let poodle = Poodle()
poodle.speak()

let dog = Dog()
dog.speak()
