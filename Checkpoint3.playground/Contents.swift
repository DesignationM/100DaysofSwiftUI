import UIKit

var greeting = "Hello, checkpoint 3"


/// Fizz buzz: Your goal is ot loop from 1 through 100 and for each number
/// if it's a multple of 3, print Fizz
/// if its a multiple of 5 print Buzz
/// if its a multiplel of 3 AND 5 print FIzzBuzz
/// otherwise just print the number

func printFizz() {
	print("Fizz")
}

func printBuzz() {
	print("Buzz")
}

func printFizzBuzz(){
	
}

for i in 1...100 {
	var fizz: Bool = false
	var buzz: Bool = false
	
	if i.isMultiple(of: 3) {
		fizz = true
	}
	if i.isMultiple(of: 5){
		buzz = true
	}
	
	if fizz && buzz {
		print("FizzBuzz")
	} else if fizz {
		print("Fizz")
	} else if buzz {
		print("Buzz")
	} else {
		print(i)
	}
}
