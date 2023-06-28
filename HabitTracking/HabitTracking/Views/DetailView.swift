//
//  DetailView.swift
//  HabitTracking
//
//  Created by KogaWolfe on 6/27/23.
//

import SwiftUI

struct DetailView: View {
	let item: Item
    var body: some View {
		Form {
			Text("Title: \(item.title)")
			Text("Desc: \(item.description)")
		}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: Item(title: "Test Item", description: "An item we're using."))
    }
}
