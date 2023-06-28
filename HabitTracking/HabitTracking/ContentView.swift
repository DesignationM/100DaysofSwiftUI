//
//  ContentView.swift
//  HabitTracking
//
//  Created by KogaWolfe on 6/27/23.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var items = Tracker()
	
	@State private var showingAddItem = false
	
    var body: some View {
		NavigationView {
			if items.trackedItems.isEmpty {
				DefaultView()
					.sheet(isPresented: $showingAddItem) {
						AddView(items: items)
					}
					.toolbar {
						Button {
							showingAddItem = true
						} label: {
							Image(systemName: "plus.circle")
						}
					}
			} else {
				List {
					Section {
						ForEach(items.trackedItems) { habitItem in
							NavigationLink {
								DetailView(item: habitItem, items: items)
							} label: {
								ListItem(item: habitItem)
							}
						}
						.onDelete(perform: removeItem)
					}
					
				}
				
				.toolbar {
					Button {
						showingAddItem = true
					} label: {
						Image(systemName: "plus.circle")
					}
				}
				.sheet(isPresented: $showingAddItem) {
					AddView(items: items)
				}
			}
		}
    }
	
	func removeItem(at offsets: IndexSet) {
		items.trackedItems.remove(atOffsets: offsets)
	}
}
struct DefaultView: View {
	var body: some View {
		Text("Add a new item to track using the plus sign above.")
			.padding()
	}
}

struct ListItem: View {
	let item: Item
	var body: some View {
		VStack {
			Text(item.title)
				.font(.headline)
			Text(item.description)
				.font(.subheadline)
		}
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: Tracker())
    }
}
