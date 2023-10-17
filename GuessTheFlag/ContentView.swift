//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Goodwasp on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Russia", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
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
                    Button{
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue") { askQuestion() }
        } message: {
            Text("Your score is ???")
        }
    }
    
    private func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
