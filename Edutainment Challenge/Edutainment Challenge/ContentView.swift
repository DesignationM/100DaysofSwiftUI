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
	@State var questionBank = [questionPair]()
	@State var showQuestions = false
	
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
				}
				.pickerStyle(.segmented)
				
			} header: {
				Text("Setup")
			}
			
			
			Button("Generate") {
				test()
			}
			if showQuestions {
				Section {
					withAnimation {
						ForEach(questionBank) { bank in
							QuestionView(question: bank)
						}
					}
				} header: {
					Text("Questions and Answers")
				}
			}
		}
    }
	
	func test() {
		questionBank = []
		// print("something")
		// let tempAmt = questionChoice + 1
		//		ForEach(0..<questionAmount, id: \.self) { amount in
		//			print(amount + 1)
		//	}
		var temp = 1
		
		while(temp <= questionChoice) {
			let tableLimit = tablesToPractice + 1
			let part1 = Int.random(in: 2..<tableLimit)
			let part2 = Int.random(in: 2..<13)
			questionBank.append(questionPair(questions: (part1, part2)))
			print(temp)
			temp += 1
		}
		print(questionBank)
		//print(questionChoice)
		//print(tempAmt)
		showQuestions = true
	}
	
}
struct questionPair: Identifiable {
	var id: UUID = UUID()
	var questions: (Int, Int)
}

struct QuestionView: View {
	var question: questionPair
	@State var answer = 0
	@State var showAnswer = false
	var body: some View {
		let answer = question.questions.0 * question.questions.1
		HStack {
			VStack {
				Text("\(question.questions.0) x \(question.questions.1)")
				TextField("", value: $answer, format: .number)
					.keyboardType(.decimalPad)
					.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
					.frame(maxWidth: 40)
					.multilineTextAlignment(.center)
			}
			Spacer()
			Button("Check") {
				checkAnswer()
			}
			if showAnswer {
				let questionAnswer = question.questions.0 * question.questions.1
				let isCorrect = answer == questionAnswer
				Image(systemName: isCorrect ? "checkmark.seal.fill" : "wrongwaysign.fill")
					.foregroundColor(isCorrect ? .green : .red)
			}

			
		}
	}
	func checkAnswer() {https:
		showAnswer = true
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
