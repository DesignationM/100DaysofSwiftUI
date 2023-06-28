//
//  TrackerClass.swift
//  HabitTracking
//
//  Created by KogaWolfe on 6/27/23.
//

import Foundation

class Tracker: ObservableObject {
	@Published var trackedItems = [Item]()
}
