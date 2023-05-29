//
//  ContentView.swift
//  UnitConversion
//
//  Created by KogaWolfe on 5/29/23.
//

import SwiftUI

struct ContentView: View {
	
	@State var startValue = 1.0
	@State private var inputChoice = "Day"
	@State private var outputChoice = "Day"
	
	var minValueInSeconds: Double {
		// convert input to smallest value - seconds
		switch inputChoice {
		case "Day":
			return startValue * 86400
		case "Hour":
			return startValue * 3600
		case "Min":
			return startValue * 60
		default: return startValue
		}
	}
	var endingValue: Double {
		switch outputChoice {
		case "Day":
			return minValueInSeconds / 86400
		case "Hour":
			return minValueInSeconds / 3600
		case "Min":
			return minValueInSeconds / 60
		default: return minValueInSeconds
		}
	}
	let timeChoices = ["Day", "Hour", "Min", "Sec"]
	
	var body: some View {
		NavigationStack{
			Form {
				Section {
					TextField("Value", value: $startValue, format: .number)
						.keyboardType(.decimalPad)
					Picker("Input type", selection: $inputChoice) {
						ForEach(timeChoices, id: \.self) { choice in
							Text(choice)
						}
					} .pickerStyle(.segmented)
				} header: {
					Text("Starting Value: \(minValueInSeconds.formatted()) seconds")
				}
				
				Section {
					Text("\(endingValue.formatted())")
					Picker("Input type", selection: $outputChoice) {
						ForEach(timeChoices, id: \.self) { choice in
							Text(choice)
						}
					} .pickerStyle(.segmented)
				} header: {
					Text("Ending Value")
				}
			}
			.navigationTitle("Time Conversion")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
