//
//  ContentView.swift
//  MoonShot
//
//  Created by KogaWolfe on 6/18/23.
//

import SwiftUI

struct ContentView: View {
	let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	let missions: [Mission] = Bundle.main.decode("missions.json")
	
	let columns = [
		GridItem(.adaptive(minimum: 150))
	]
    var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: columns) {
					ForEach(missions) { mission in
						NavigationLink {
							Text("Detail view")
						} label: {
							VStack {
								Image(mission.image)
									.resizable()
									.scaledToFit()
									.frame(width: 100, height: 100)
									.padding()
								
								VStack {
									Text(mission.displayName)
										.font(.headline)
										.foregroundColor(.white)
									Text(mission.formattedLaunchDate)
										.font(.caption)
										.foregroundColor(.white.opacity(0.5))
								}
								.padding(.vertical)
								.frame(maxWidth: .infinity)
								.background(.lightBackground)
							}
							.background(.white)
							.clipShape(RoundedRectangle(cornerRadius: 10))
							.overlay(
								RoundedRectangle(cornerRadius: 10)
									.stroke(.lightBackground)
							)
						}
					}
				}
				.padding([.horizontal, .bottom])
			}
			.navigationTitle("Moonshot")
			.background(.darkBackground)
			.preferredColorScheme(.dark)
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
