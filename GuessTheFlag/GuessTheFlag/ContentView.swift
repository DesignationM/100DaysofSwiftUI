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
//			LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
//				.ignoresSafeArea()
			RadialGradient(stops: [
				.init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
				.init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
			], center: .top, startRadius: 200, endRadius: 400)
			.ignoresSafeArea()
			VStack {
				Spacer()
				Text("Guess the flag")
					.font(.largeTitle.bold())
					.foregroundColor(.white)
				VStack(spacing: 15){
					VStack{
						Text("Tap the flag of")
							.foregroundColor(.secondary)
							.font(.subheadline.weight(.heavy))
						Text(countries[correctAnswer])
							.font(.largeTitle.weight(.semibold))
							.foregroundColor(.secondary)
					}
					.frame(maxWidth: .infinity)
					.padding(.vertical, 20)
					.background(.regularMaterial)
					.clipShape(RoundedRectangle(cornerRadius: 20))
					ForEach(0..<3) { number in
						Button {
							// flag was tapped
							flagTapped(number)
						} label: {
							Image(countries[number])
								.renderingMode(.original)
								.clipShape(RoundedRectangle(cornerRadius: 5))
								.shadow(radius: 5)
						}
					}
				}
				Spacer()
				Spacer()
				Text("Score: ???")
					.foregroundColor(.white)
					.font(.title.bold())
				Spacer()
			}
			.padding()
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
