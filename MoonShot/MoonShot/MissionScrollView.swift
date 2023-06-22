//
//  MissionScrollView.swift
//  MoonShot
//
//  Created by KogaWolfe on 6/21/23.
//
// 	Challenge 2: Extract one or two pieces of view code into their own new
// 	SwiftUI views - the horizontal scroll view in MissionView is a great
// 	candidate, but if you followed my styling then you coudl also move the
// 	Rectangle dividers out too

import SwiftUI

struct MissionScrollView: View {
	let crew: [CrewMember]
	
	
	init(crew: [CrewMember]) {
		self.crew = crew
	}
	init(mission: Mission, astronauts: [String: Astronaut]) {
		// self.mission = mission
		
		self.crew = mission.crew.map { member in
			if let astronaut = astronauts[member.name] {
				return CrewMember(role: member.role, astronaut: astronaut)
			} else {
				fatalError("Missing \(member.name)")
			}
		}
	}
	
    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(crew, id: \.role) { crewMember in
					NavigationLink {
						AstronautView(astronaut: crewMember.astronaut)
					} label: {
						HStack {
							Image(crewMember.astronaut.id)
								.resizable()
								.frame(width: 104, height: 72)
								.clipShape(RoundedRectangle(cornerRadius: 14))
								.overlay(
									RoundedRectangle(cornerRadius: 14)
										.strokeBorder(.white, lineWidth: 1)
								)
							VStack(alignment: .leading) {
								Text(crewMember.astronaut.name)
									.foregroundColor(.white)
									.font(.headline)
								Text(crewMember.role)
									.foregroundColor(.secondary)
							}
						}
						.padding(.horizontal)
					}
					
				}
			}
		}
    }
}

struct MissionScrollView_Previews: PreviewProvider {
	static let missions: [Mission] = Bundle.main.decode("missions.json")
	static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
	
    static var previews: some View {
        MissionScrollView(mission: missions[0], astronauts: astronauts)
			.preferredColorScheme(.dark)
    }
}
