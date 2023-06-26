//
//  ArcView.swift
//  Drawing
//
//  Created by KogaWolfe on 6/26/23.
//

import SwiftUI

struct ArcView: View {
    var body: some View {
		Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockWise: true)
			.stroke(.blue, lineWidth: 10)
			.frame(width: 300, height: 300)
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

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView()
    }
}
