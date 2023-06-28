//
//  Item.swift
//  HabitTracking
//
//  Created by KogaWolfe on 6/27/23.
//

import Foundation

struct Item: Identifiable, Codable, Equatable {
	let id = UUID()
	let title: String
	let description: String
	var completed = 0
}
