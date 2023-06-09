//
//  ContentView.swift
//  WordScramble
//
//  Created by KogaWolfe on 6/8/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       List {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
	   .listStyle(.grouped)
        // .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
