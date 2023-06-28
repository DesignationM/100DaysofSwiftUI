//
//  DetailView.swift
//  HabitTracking
//
//  Created by KogaWolfe on 6/27/23.
//

import SwiftUI

struct DetailView: View {
	let item: Item
	@ObservedObject var items: Tracker
	var body: some View {
		VStack {
			Form {
				Text("Title: \(item.title)")
				Text("Desc: \(item.description)")
				Text("Completed: \(item.completed)")
				
			}
			Button("Increment") {
				var newItem = item
				newItem.completed += 1
				if let arrayItem = items.trackedItems.firstIndex(of: item) {
					items.trackedItems[arrayItem] = newItem
				}
			}
			.buttonStyle(.borderedProminent)
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Item(title: "Test Item", description: "An item we're using."),
				   items: Tracker())
    }
}
