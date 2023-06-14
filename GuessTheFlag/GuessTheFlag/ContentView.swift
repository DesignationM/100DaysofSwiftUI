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
	@State private var score = 0
	
	@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	@State private var correctAnswer = Int.random(in: 0...2)
	@State private var attempts = 0
	@State private var isShowingSummary = false
	@State private var firstFlag = false
	@State private var secondFlag = false
	@State private var thirdFlag = false
	@State private var opacity = [1.0, 1.0, 1.0]
	@State private var animationAmount = [0.0, 0.0, 0.0]
	@State private var scale = [1.0, 1.0, 1.0]
	
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
							.blueTitle()
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
							attempts += 1
							flagTapped(number)
						} label: {
							FlagImage(number: number,
									  imageName: countries[number])
						}
						.rotation3DEffect(.degrees(animationAmount[number]), axis: (x: 0, y: 1, z: 0))
						.opacity(opacity[number])
						.scaleEffect(scale[number])
						
					}
				}
				Spacer()
				Spacer()
				Text("Score: \(score)")
					.foregroundColor(.white)
					.font(.title.bold())
				Spacer()
			}
			.padding()
		}
		.alert(scoreTitle, isPresented: $showingScore) {
			Button("Contine", action: askQuestion)
		} message: {
			Text("Your score is \(score)")
		}
		.alert("Final Score", isPresented: $isShowingSummary) {
			Button("Restart", action: resetGame)
		} message: {
			Text("Your final score is \(score)")
		}
	}
	
	func flagTapped(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
			score += 1
		} else {
			scoreTitle = "Wrong, \n That's the flag of \(countries[number])"
		}
		/// Challenge 2
		/// Make the other two buttons fade out to 25% opacity
		if number == 0 {
			withAnimation(
				.interpolatingSpring(stiffness: 5, damping: 2)) {
					animationAmount[number] += 360
					opacity[1] -= 0.25
					opacity[2] -= 0.25
					scale[1] -= 0.25
					scale[2] -= 0.25
				}
		} else if number == 1 {
			withAnimation(
				.interpolatingSpring(stiffness: 5, damping: 2)) {
					animationAmount[number] += 360
					opacity[0] -= 0.25
					opacity[2] -= 0.25
					scale[0] -= 0.25
					scale[2] -= 0.25
				}
		} else {
			withAnimation(
				.interpolatingSpring(stiffness: 5, damping: 2)) {
					animationAmount[number] += 360
					opacity[0] -= 0.25
					opacity[1] -= 0.25
					scale[0] -= 0.25
					scale[1] -= 0.25
				}
		}
		showingScore = true
		if attempts == 8 {
			isShowingSummary = true
		}
	}
	
	func askQuestion() {
		withAnimation {
			countries.shuffle()
			correctAnswer = Int.random(in: 0...2)
			animationAmount = [0.0, 0.0, 0.0]
			opacity = [1.0, 1.0, 1.0]
			scale = [1.0, 1.0, 1.0]
		}
	}
						  
	func resetGame() {
		attempts = 0
		score = 0
		isShowingSummary = false
		showingScore = false
	}
	
}

struct FlagImage: View {
	@State var number: Int

	let imageName: String
	var body: some View {
		Image(imageName)
			.renderingMode(.original)
			.clipShape(RoundedRectangle(cornerRadius: 5))
			.shadow(radius: 5)
		/// Animation project wrap up
		/// Challenge 1: when you tap a flag, make it spin around 360 degrees on the Y axis.

//			.onTapGesture {
//
//				}
//
	}
}

extension View {
	func blueTitle() -> some View {
		modifier(BlueText())
	}
}
struct BlueText: ViewModifier {
	func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.blue)
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
