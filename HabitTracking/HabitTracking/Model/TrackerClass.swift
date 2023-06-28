//
//  TrackerClass.swift
//  HabitTracking
//
//  Created by KogaWolfe on 6/27/23.
//

import Foundation

class Tracker: ObservableObject {
	@Published var trackedItems = [Item]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(trackedItems) {
				UserDefaults.standard.set(encoded, forKey: "Items")
			}
		}
	}
	
	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Items") {
			if let decodedItems = try? JSONDecoder().decode([Item].self, from: savedItems) {
				trackedItems = decodedItems
				return
			}
		}
		
		trackedItems = []
	}
}
