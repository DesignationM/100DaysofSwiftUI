//
//  TriangleView.swift
//  Drawing
//
//  Created by KogaWolfe on 6/26/23.
//

import SwiftUI

struct TriangleView: View {
    var body: some View {
		Triangle()
			.stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
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

struct TriangleView_Previews: PreviewProvider {
    static var previews: some View {
        TriangleView()
    }
}
