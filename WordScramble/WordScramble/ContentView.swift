//
//  ContentView.swift
//  WordScramble
//
//  Created by KogaWolfe on 6/8/23.
//

import SwiftUI

struct ContentView: View {
	@State private var usedWords = [String]()
	@State private var rootWord = ""
	@State private var newWord = ""
	
	@State private var errorTitle = ""
	@State private var errorMessage = ""
	@State private var showingError = false
	
	@State private var score = 0
	
    var body: some View {
		NavigationView {
			List {
				Section {
					TextField("Enter your word", text: $newWord)
						.textInputAutocapitalization(.never)
				}
				/// Chellenge 3:
				/// Put a text view somewhere so you can track and show the player's score for a given root word.
				/// How you calcuate the score is up to you, but something involving number of words
				/// and their letter count would be reasonable.
				
				Text("Score: \(score)")
				
				Section {
					ForEach(usedWords, id: \.self) { word in
						HStack {
							Image(systemName: "\(word.count).circle")
							Text(word)
						}
						
					}
				}
				
			
			}
			.navigationTitle(rootWord)
			.onSubmit(addNewWord)
			.onAppear(perform: startGame)
			.alert(errorTitle, isPresented: $showingError) {
				Button("OK", role: .cancel) {}
			} message: {
				Text(errorMessage)
			}
			// Challenge 2: Add a toolbar button that calls startGame(), so users can restart with a new word whenever they want to.
			.toolbar {
				Button( action: {
					 restart()
				}, label: {
					Image(systemName: "arrowshape.turn.up.left.2.circle")
						.font(.title3)
				})
			}
		}
        // .padding()
    }
	
	func addNewWord() {
		let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
		
		// Challenge 1, disallow answers that are shorter than 3 letters or just our start word
		
		guard answer.count > 3 else {
			wordError(title: "Word too short", message: "Must be longer than 3 character")
			return
		}
		
		guard isNotOriginalWord(word: answer) else {
				wordError(title: "Word must be original", message: "Can't use the starting word as a guess")
			return
		}
		
		newWord = ""
		
		
		guard isOriginal(word: answer) else {
			wordError(title: "Word used already", message: "Be more original")
			return
		}
		
		guard isPossible(word: answer) else {
			wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)!")
			return
		}
		
		guard isReal(word: answer) else {
			wordError(title: "Word not recognized", message: "you can't just make them up, you know!")
			return
		}
		
		updateScore(answerLength: answer.count)
		
		withAnimation {
			usedWords.insert(answer, at: 0)
		}
	}
	
	func startGame() {
		// 1. Find the URL for start.tct in our app bundle
		if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
			// 2. Load start.txt into a string
			if let startWords = try? String(contentsOf: startWordsURL) {
				// 3. Split the string up into an array of strings, splitting on line breaks
				let allWords = startWords.components(separatedBy: "\n")
				
				// 4. Pick one random word, or use "silkworm" as a sensible default
				rootWord = allWords.randomElement() ?? "silkworm"
				
				// If we are here everything has worked, so we can exit
				return
			}
		}
		
		// If we are *here* then there was a problem - trigger a crash and report the error
		
	fatalError("Could not load start.tct from bundle.")
	}
	
	func restart() {
		score = 0
		usedWords = []
		startGame()
	}
	func isOriginal(word: String) -> Bool {
		!usedWords.contains(word)
	}
	
	func isPossible(word: String) -> Bool {
		var tempWord = rootWord
		
		for letter in word {
			if let pos = tempWord.firstIndex(of: letter) {
				tempWord.remove(at: pos)
			} else {
				return false
			}
		}
		return true
	}
	
	func isReal(word: String) -> Bool {
		let checker = UITextChecker()
		let range = NSRange(location: 0, length: word.utf16.count)
		let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
		
		return misspelledRange.location == NSNotFound
	}
	
	func isNotOriginalWord(word: String) -> Bool {
		rootWord != word
	}
	
	func wordError(title: String, message: String) {
		errorTitle = title
		errorMessage = message
		showingError = true
	}
	
	func updateScore(answerLength: Int) {
		score += answerLength
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
