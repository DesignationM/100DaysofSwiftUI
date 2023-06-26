//
//  ContentView.swift
//  Drawing
//
//  Created by KogaWolfe on 6/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		ZStack {
			/// Challenge 1: Create an Arrow shape - having it
			/// point straight up is fine.
			/// This could be a rectangle/triangle-style arrow,
			/// or perhaps three lines,
			/// or maybe something else depending on
			/// what kind of arrow you want to draw.
			Group {
				Triangle()
				Rectangle()
					.frame(width: 50, height: 200)
			}
			.drawingGroup()
			
			///
			/// Challenge 2: Make the line thickness of your Arrow
			/// shape animatable.

			
			/// Create a ColorCyclingRectangle shape that is
			/// the rectangular cousin of ColorCyclingCircle,
			/// allowing us to control the position
			/// of the gradient using one or more properties
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
