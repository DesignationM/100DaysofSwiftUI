//
//  AddView.swift
//  HabitTracking
//
//  Created by KogaWolfe on 6/27/23.
//

import SwiftUI

struct AddView: View {
	@State private var title = ""
	@State private var description = ""
	@ObservedObject var items: Tracker
	@Environment(\.dismiss) var dismiss
    var body: some View {
		NavigationView {
			Form {
				TextField("Name", text: $title)
				TextField("Habit Description to Track", text: $description)
			}
			.navigationTitle("Add new tracker item")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				Button("Save") {
					let item = Item(title: title,
									description: description)
					items.trackedItems.append(item)
					dismiss()
				}
			}
		}
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
		AddView(items: Tracker())
    }
}
