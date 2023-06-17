//
//  ExpenseItem.swift
//  iExpense
//
//  Created by KogaWolfe on 6/16/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
	var id = UUID()
	let name: String
	let type: String
	let amount: Double
}
