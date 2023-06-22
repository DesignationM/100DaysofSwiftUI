//
//  ContentView.swift
//  MoonShot
//
//  Created by KogaWolfe on 6/18/23.
//
// Challenge 3: For a tough challenge, add a toolbar item to ContentView that toggles
// between showing missions as a grid and as a list.

import SwiftUI

struct ContentView: View {
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	@State var displayGrid: Bool = true
	
    var body: some View {
		NavigationView {
				Group {
				if displayGrid {
					GridLayout(astronauts: astronauts, missions: missions)
				} else {
					ListLayout(astronauts: astronauts, missions: missions)
				}
			}
			.navigationTitle("Moonshot")
			.background(.darkBackground)
			.preferredColorScheme(.dark)
			.toolbar {
				ToolbarItem(placement: .primaryAction) {
					Toggle(self.displayGrid ? "Grid" : "List",isOn: $displayGrid)
						.toggleStyle(.switch)
					
				}
			}
		}

    }
}

struct User: Codable {
	let name: String
	let address: Address
}

struct Address: Codable {
	let street: String
	let city: String
}



struct Mission: Codable, Identifiable {
	struct CrewRole: Codable {
		let name: String
		let role: String
	}
	let id: Int
	let launchDate: Date?
	let crew: [CrewRole]
	let description: String
	
	var displayName: String {
		"Apollo \(id)"
	}
	
	var image: String {
		"apollo\(id)"
	}
	
	var formattedLaunchDate: String {
		launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
	}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
