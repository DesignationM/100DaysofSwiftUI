//
//  ViewMultiply.swift
//  Drawing
//
//  Created by KogaWolfe on 6/26/23.
//

import SwiftUI

struct ViewMultiply: View {
	var body: some View {
		VStack {
			Image("PaulHudson")
				.colorMultiply(.red)
//			Rectangle()
//				.fill(.red)
//				.blendMode(.multiply)
		}
	}
}

struct ViewMultiply_Previews: PreviewProvider {
    static var previews: some View {
        ViewMultiply()
    }
}
