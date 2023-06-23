//
//  ContentView.swift
//  Drawing
//
//  Created by KogaWolfe on 6/22/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
			Triangle()
			// .fill(.blue)
			.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
			
			Triangle()
				.fill(.red)
				.frame(width: 300, height: 300)
			
			Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockWise: true)
				.stroke(.blue, lineWidth: 10)
				.frame(width: 300, height: 300)
			
			Circle()
				.strokeBorder(.blue, lineWidth: 40)
        }
        .padding()
    }
}

struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		
		path.move(to: CGPoint(x: 200, y: 100))
		path.addLine(to: CGPoint(x:100, y: 300))
		path.addLine(to: CGPoint(x:300, y: 300))
		path.addLine(to: CGPoint(x:200, y: 100))
		
		return path
	}
}

struct Arc: InsettableShape {
	var startAngle: Angle
	var endAngle: Angle
	var clockWise: Bool
	var insetAmount = 0.0
	func path(in rect: CGRect) -> Path {
		let rotationAdjustment = Angle.degrees(90)
		let modifiedStart = startAngle - rotationAdjustment
		let modifiedEnd = endAngle - rotationAdjustment
		var path = Path()
		path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockWise)
		
		return path
	}
	
	func inset(by amount: CGFloat) -> some InsettableShape {
		var arc = self
		arc.insetAmount += amount
		return arc
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
