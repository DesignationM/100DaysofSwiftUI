//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by KogaWolfe on 5/30/23.
//

import SwiftUI

struct ContentView: View {
	@State private var showingScore = false
	@State private var scoreTitle = ""
	
	@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	@State private var correctAnswer = Int.random(in: 0...2)
	var body: some View {
		ZStack {
			Color.blue
				.ignoresSafeArea()
			VStack(spacing: 30){
				VStack{
					Text("Tape the flag of")
						.foregroundColor(.white)
					Text(countries[correctAnswer])
						.foregroundColor(.white)
				}
				ForEach(0..<3) { number in
					Button {
						// flag was tapped
						flagTapped(number)
					} label: {
						Image(countries[number])
							.renderingMode(.original)
					}
				}
			}
		}
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Contine", action: askQuestion)
		} message: {
			Text("Your score is ???")
		}
	}
	
	func flagTapped(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
		} else {
			scoreTitle = "Wrong"
		}
		showingScore = true
	}
	
	func askQuestion() {
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2)
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
