//
//  ContentView.swift
//  Edutainment Challenge
//
//  Created by KogaWolfe on 6/14/23.
//	Your goal is to build an "edutainmnet" app for kids to help them practice multiplicationtables
/// The player needs to select which multiplication tables they want to practice. this could be pressing buttons or it could be an "up to..." stepper going from 2 to 12
/// The player should be able to select how many questions they want to be asked: 5, 10, or 20
/// You should randomly generate as many questions as they asked for, withing the difficulty range they asked for

import SwiftUI

struct ContentView: View {
	@State var questionChoice = 5
	@State var tablesToPractice: Int = 2
	@State var questionBank: [Int] = []
	
	var questionAmount = [5, 10, 20]
	
    var body: some View {
		Form {
			Section {
				Stepper("Tables to Practice: \(tablesToPractice)", value: $tablesToPractice, in: 2...12)
				Text("How many questions:")
				Picker("How many questions:", selection: $questionChoice) {
					ForEach(questionAmount, id: \.self) { choice in
						Text("\(choice)")
					}
				} .pickerStyle(.segmented)
				
			} header: {
				Text("Setup")
			}
			
			
				Button("Generate", action: test)
			
		}
    }
	func test() {
		let tempAmt = questionChoice + 1
		print(tempAmt)
		print("something")
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
