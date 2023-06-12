//
//  ContentView.swift
//  Animations
//
//  Created by KogaWolfe on 6/11/23.
//

import SwiftUI

struct ContentView: View {
	@State private var animationAmount = 0.0

    var body: some View {
		VStack {
		//	Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
			
		//	Spacer()
			
			Button("Tap Me") {
				// animationAmount += 0.1
				withAnimation(
					// animationAmount += 360
					.interpolatingSpring(stiffness: 5, damping: 1)) {
						animationAmount += 360
					}
				
			}
			.padding(50)
			.background(.red)
			.foregroundColor(.white)
			.clipShape(Circle())
			.rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
			// .scaleEffect(animationAmount)
//			.overlay(
//				Circle()
//					.stroke(.red)
//					.scaleEffect(animationAmount)
//					.opacity(2 - animationAmount)
//					.animation(
//						.easeOut(duration: 1)
//							.repeatForever(autoreverses: false),
//						value: animationAmount)
//			)
//			.onAppear {
//				animationAmount = 2
//			}
			
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
