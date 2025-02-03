//
//  ContentView.swift
//  macOSapp
//
//  Created by Erik Bershel on 3.2.25..
//

import SwiftUI

struct ContentView: View {
    @State var displayText: String = "This is a test text line"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(displayText)
                .accessibilityIdentifier("outputLabel")
            Button("Tap me") {
                displayText = "Text has been changed!"
                print("Button was tapped")
            }
                .accessibilityIdentifier("tapMeButton")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
