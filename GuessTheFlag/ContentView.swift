//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Goodwasp on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }.foregroundStyle(.white)
                
                ForEach(0..<3) { number in
                    Button(action: {} ) {
                        Image(countries[number])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
