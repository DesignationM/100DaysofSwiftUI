//
//  Expenses.swift
//  iExpense
//
//  Created by KogaWolfe on 6/16/23.
//

import Foundation

class Expenses: ObservableObject {
	@Published var items = [ExpenseItem]() {
		didSet {
			if let encoded = try? JSONEncoder().encode(items) {
				UserDefaults.standard.set(encoded, forKey: "Items")
			}
		}
	}
	
	init() {
		if let savedItems = UserDefaults.standard.data(forKey: "Items") {
			if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
				items = decodedItems
				return
			}
		}
		
		items = []
	}
}
