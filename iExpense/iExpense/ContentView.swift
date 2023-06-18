//
//  ContentView.swift
//  iExpense
//  Created by KogaWolfe on 6/15/23.
//

import SwiftUI

struct ContentView: View {
	@StateObject var expenses = Expenses()
	@State private var showingAddExpense = false

    var body: some View {
		NavigationView {
			List  {
				/// Challenge 3: For a bigger challenge, try splitting the expenses list into two section:
				///  one for personal expenses and one for business expenses.
				Section {
					ForEach(expenses.items) {item in
						if item.type == "Personal" {
							HStack {
								VStack(alignment: .leading) {
									Text(item.name)
										.font(.headline)
									
									Text(item.type)
								}
								Spacer()
				/// Challenge 1: Use the users preferred currency, rather than always using US Dollars
				/// Challenge 2: Modify the expense amounts in ContentView to contain some styling
				/// depending on their value - expenses under $10 should have one style, expenses under
				/// $100 another and expenses over $100 a third. What those styles are depend on you
								Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
									.foregroundColor(textColor(amount: item.amount))
								//						} else if item.amount > 10 && item.amount < 100 {
								//							.foregroundColor(.red)
								//						}
								
							}
						}
					}.onDelete(perform: removeItems)
				} header: {
					Text("Personal expenses")
				}
				Section {
					ForEach(expenses.items) { seconditem in
						if seconditem.type == "Business" {
							HStack {
								VStack(alignment: .leading) {
									Text(seconditem.name)
										.font(.headline)
									
									Text(seconditem.type)
								}
								Spacer()
				/// Challenge 1: Use the users preferred currency, rather than always using US Dollars
				/// Challenge 2: Modify the expense amounts in ContentView to contain some styling
				/// depending on their value - expenses under $10 should have one style, expenses under
				/// $100 another and expenses over $100 a third. What those styles are depend on you
								Text(seconditem.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
									.foregroundColor(textColor(amount: seconditem.amount))
							}
						}
					}.onDelete(perform: removeItems)
				} header: {
					Text("Business expenses")
				}
				
			}
			.navigationTitle("iExpense")
			.toolbar {
				Button {
					showingAddExpense = true
				} label: {
					Image(systemName: "plus")
				}
			}
			.sheet(isPresented: $showingAddExpense) {
				AddView(expenses: expenses)
			}
		}
	
	}
	
	func textColor(amount: Double) -> Color {
		if amount > 100 {
			return .green
		} else if amount > 10 {
			return .gray
		} else {
			return .red
		}
	}
	
	func removeItems(at offsets: IndexSet) {
		expenses.items.remove(atOffsets: offsets)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
