//
//  ContentView.swift
//  MoonShot
//
//  Created by KogaWolfe on 6/18/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        GeometryReader { geo in
//            Image("Batman")
//				.resizable()
//				.scaledToFit()
//				.frame(width: geo.size.width * 0.8)
//				.frame(width: geo.size.width, height: geo.size.height)
//        }
//		ScrollView(.horizontal) {
//			LazyHStack(spacing: 10) {
//				ForEach(0..<100) {
//					Text("Item \($0)")
//						.font(.title)
//				}
//			}
//			
//		}
//		NavigationView {
//			List(0..<100) { row in
//				NavigationLink {
//					Text("Detail \(row)")
//				} label: {
//					Text("Row \(row)")
//						.padding()
//				}
//			}
//			.navigationTitle("SwiftUI")
//
//		}
		VStack {
			Button("Decode JSON") {
				let input = """
 {
  "name": "Taylor Swift",
  "address": {
   "street": "555 Taylor Swift Avenue",
   "city": "Nashville"
  }
 }
 """
				print("test")
				let data = Data(input.utf8)
				let decoder = JSONDecoder()
				if let user = try? decoder.decode(User.self, from: data) {
					print(user.address.street)
				}
				// .padding()
			}
		}
    }
}

struct User: Codable {
	let name: String
	let address: Address
}

struct Address: Codable {
	let street: String
	let city: String
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
