//
//  ContentView.swift
//  Drawing
//
//  Created by KogaWolfe on 6/22/23.
//

import SwiftUI

struct ContentView: View {
	@State private var petalOffset = -20.0
	@State private var petalWidth = 100.0
	
	@State private var colorCycle = 0.0
	
	@State private var insetAmount = 50.0
	
	@State private var rows = 4
	@State private var columns = 4
	
	@State private var innerRadius = 125.0
	@State private var outerRadius = 75.0
	@State private var distance = 25.0
	@State private var amount = 1.0
	@State private var hue = 0.6
	
    var body: some View {
		//ZStack {
		VStack(spacing: 0) {
			Spacer()
//			Trapezoid(insetAmount: insetAmount)
//					.frame(width: 200, height: 100)
//					.onTapGesture {
//						withAnimation {
//							insetAmount = Double.random(in: 10...90)
//						}
//				}
//			Spacer()
//			Checkerboard(rows: rows, columns: columns)
//				.onTapGesture {
//					withAnimation(.linear(duration: 3)) {
//						rows = 8
//						columns = 16
//					}
//				}
			Spirograph(innerRadius: Int(innerRadius),
					   outerRadius: Int(outerRadius),
					   distance: Int(distance),
					   amount: amount)
			.stroke(Color(hue: hue,
						  saturation: 1,
						  brightness: 1),
			lineWidth: 1)
			.frame(width: 300, height: 300)
			Spacer()
			
			Group {
				Text("Inner radius: \(Int(innerRadius))")
				Slider(value: $innerRadius, in: 10...150, step: 1)
					.padding([.horizontal, .bottom])
				
				Text("Outer radius: \(Int(outerRadius))")
				Slider(value: $outerRadius, in: 10...150, step: 1)
					.padding([.horizontal, .bottom])
				
				Text("Distance: \(Int(distance))")
				Slider(value: $distance, in: 1...150, step: 1)
					.padding([.horizontal, .bottom])
				
				Text("Amount: \(amount, format: .number.precision(.fractionLength(2)))")
				Slider(value: $amount)
					.padding([.horizontal, .bottom])
				
				Text("Color")
				Slider(value: $hue)
					.padding(.horizontal)
			}
		}
			//VStack {
//				Image("PaulHudson")
//				.colorMultiply(.red)
				//Rectangle()
//					.fill(.red)
//					.blendMode(.multiply)
//				ColorCyclingCircle(amount: colorCycle)
//					.frame(width: 300, height: 300)
//
//				Slider(value: $colorCycle)
//	//			Triangle()
//	//			// .fill(.blue)
//	//			.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//	//
//	//			Triangle()
//	//				.fill(.red)
//	//				.frame(width: 300, height: 300)
//	//
//	//			Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockWise: true)
//	//				.stroke(.blue, lineWidth: 10)
//	//				.frame(width: 300, height: 300)
//	//
//	//			Circle()
//	//				.strokeBorder(.blue, lineWidth: 40)
//				Flower(petalOffSet: petalOffset, petalWidth: petalWidth)
//					.fill(.red, style: FillStyle(eoFill: true))
//					//.stroke(.red, lineWidth: 1)
//
//				Text("Offset")
//				Slider(value: $petalOffset, in: -40...40)
//					.padding([.horizontal, .bottom])
//
//				Text("Width")
//				Slider(value: $petalWidth, in: 0...100)
//					.padding(.horizontal)
//			}
//			.padding()
		// }
		//.drawingGroup()
//		.frame(width: 400, height: 500)
//		.clipped()
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

struct Flower: Shape {
	// How much to move this petal away from the center
	var petalOffSet: Double = -20
	
	// How wide to make each petal
	var petalWidth: Double = 100
	
	func path(in rect: CGRect) -> Path {
		// The path that will hold all petals
		var path = Path()
		
		// Count from 0 up to pi * 2, moving up pi / 8 each time
		for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
			// rotate the petal by the current value of our loop
			let rotation = CGAffineTransform(rotationAngle: number)
			
			// move the petal to be at the center of our view
			let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height / 2))
			
			// create a path for this petal using our properties plus a fixed Y and height
			let originalPetal = Path(ellipseIn: CGRect(x: petalOffSet, y: 0, width: petalWidth, height: rect.width / 2))
			
			// apply our rotatin/position transformation to the petal
			let rotatedPetal = originalPetal.applying(position)
			
			// add it to our main path
			path.addPath(rotatedPetal)
		}
		
		// now send the main path back
		return path
	}
}

struct ColorCyclingCircle: View {
	var amount = 0.0
	var steps = 100
	
	var body: some View {
		ZStack {
			ForEach(0..<steps) { value in
				Circle()
					.inset(by: Double(value))
					.strokeBorder(color(for: value, brightness: 1), lineWidth: 2)
			}
		}
	}
	
	func color(for value: Int, brightness: Double) -> Color {
		var targetHue = Double(value) / Double(steps) + amount
		
		if targetHue > 1 {
			targetHue -= 1
		}
		
		return Color(hue: targetHue, saturation: 1, brightness: brightness)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
