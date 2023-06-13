//
//  ContentView.swift
//  Animations
//
//  Created by KogaWolfe on 6/11/23.
//

import SwiftUI

struct ContentView: View {
	@State private var animationAmount = 0.0
	@State private var dragAmount = CGSize.zero
	@State private var enabled = false
	let letters = Array("Hello SwiftUI")
	@State private var isShowingRed = false
    var body: some View {
		VStack {
			HStack(spacing: 0) {
				ForEach(0..<letters.count, id: \.self) { num in
					Text(String(letters[num]))
						.padding(5)
						.font(.title)
						.background(enabled ? .blue : .red)
						.offset(dragAmount)
						.animation(.default.delay(Double(num) / 20), value: dragAmount)
				}
			}
			.gesture(
			DragGesture()
				.onChanged { dragAmount = $0.translation}
				.onEnded { _ in
					dragAmount = .zero
					enabled.toggle()
				})

			LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
				.frame(width: 300, height: 200)
				.clipShape(RoundedRectangle(cornerRadius: 10))
				.offset(dragAmount)
				.gesture(
					DragGesture()
					.onChanged { dragAmount = $0.translation }
						.onEnded { _ in //dragAmount = .zero}
							withAnimation(.spring()) {
								dragAmount = .zero
							}
						}
				)
				
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
			Button("Tap Me") {
				withAnimation {
					isShowingRed.toggle()
				}
			}
			if isShowingRed {
				Rectangle()
					.fill(.red)
					.frame(width: 200, height: 200)
					//.transition(.asymmetric(insertion: .scale, removal: .opacity))
					.transition(.pivot)
			}
        }
		.onTapGesture {
			withAnimation {
				isShowingRed.toggle()
			}
		}
        .padding()
    }
}
struct CornerRotateModifier: ViewModifier {
	let amount: Double
	let anchor: UnitPoint
	
	func body(content: Content) -> some View {
		content
			.rotationEffect(.degrees(amount), anchor: anchor)
			.clipped()
	}
}
extension AnyTransition {
	static var pivot: AnyTransition {
		.modifier(active: CornerRotateModifier(amount: -90, anchor: .topLeading), identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
