//
//  ContentView.swift
//  RockPaperScissor
//
//  Created by KogaWolfe on 6/4/23.
//

import SwiftUI

struct ContentView: View {
	@State private var choices = ["Rock 🪨", "Paper 📃", "Scissor ✂️"].shuffled()
	@State private var winLoseOption = Bool.random()
	
	@State private var attempts = 10
	@State private var isShowingSummary = false
	@State private var score = 0
	@State private var scoreTitle = ""
	
	var body: some View {
        VStack {
			Spacer()
			Text(buildGameString())
				.font(.system(size: 35))
			HStack {
				Button {
					setValue(SelectedOption: 0)
				} label: {
					Text("Rock 🪨")
				}
				.buttonStyle(.borderedProminent)
				Button {
					setValue(SelectedOption: 1)
				} label: {
					Text("Paper 📃")
					
				}
				.buttonStyle(.borderedProminent)
				Button {
					setValue(SelectedOption: 2)
				} label: {
					Text("Scissor ✂️")
				}
				.buttonStyle(.borderedProminent)
			}
			.padding(.bottom)
			Text("Remaining tries: \(attempts)")
			Text("Score: \(score)")
			
			Spacer()
        }
        .padding()
		.alert("Final Score", isPresented: $isShowingSummary) {
					Button("Restart", action: resetGame)
				} message: {
					Text("Your final score is \(score)")
				}
    }
	func buildGameString() -> String {
		return "\(winLoseOption ? "Win" : "Lose") against \(choices[0])"
	}
	func setValue(SelectedOption: Int) {
		switch choices[0] {
		case "Rock 🪨":
			if winLoseOption && SelectedOption == 1 || !winLoseOption && SelectedOption == 2{
				score += 1
			}
			break
		case "Paper 📃":
			if winLoseOption && SelectedOption == 2 || !winLoseOption && SelectedOption == 0{
				score += 1
			}
			break
		case "Scissor ✂️":
			if winLoseOption && SelectedOption == 0 || !winLoseOption && SelectedOption == 1 {
				score += 1
			}
			break
		default:
			return
		}
		winLoseOption.toggle()
		choices.shuffle()
		attempts -= 1
		if attempts <= 0 {
			isShowingSummary = true
		}
	}
	func resetGame() {
		attempts = 10
		score = 0
		isShowingSummary = false
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
