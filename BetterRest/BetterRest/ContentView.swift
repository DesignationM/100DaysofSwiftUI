//
//  ContentView.swift
//  BetterRest - Project 4
//
//  Created by KogaWolfe on 6/5/23.
//

import SwiftUI

struct ContentView: View {
	@State private var wakeUp = Date.now
	
    var body: some View {
        VStack {
			DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...)
				.labelsHidden()
        }
        .padding()
    }
	
	func exampleDates() {
		let tomorrow = Date.now.addingTimeInterval(86400)
		
		let range = Date.now...tomorrow
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
