//
//  ContentView.swift
//  GuessDFlag
//
//  Created by Harsh Verma on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingScore = false
    @State var scoreTitle = ""
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State var scoreMessage = ""
    @State private var round = 1
    @State private var question = 1
    @State private var numberOfQuestions = 5
    @State private var endOfRound = false
    
    var body: some View {
        
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    
                    VStack {
                        
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .fontWeight(.heavy)
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    
                    
                    ForEach(0..<3) { number in
                        Button {
                            showingScore.toggle()
                            checkAnswer(number)
                            
                        }label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule(style: .continuous))
                                .shadow(radius: 5)
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                VStack {
                    Text("Points: \(score)")
                        .font(.largeTitle.weight(.bold))
                        .foregroundColor(.white)
                    
                    Text("Round: \(round)")
                        .font(.largeTitle.weight(.light))
                        .foregroundColor(.white)
                    
                    Text("Question \(question) out of 5")
                        .font(.largeTitle.weight(.regular))
                        .foregroundColor(.white)
                    
                }
                
                
                
            }.padding()
                .alert(scoreTitle, isPresented: $showingScore) {
                    Button("Continue", action: nextQuestion)
                    Button("Quit", role: .cancel, action: resetGame)
                }message: {
                    Text(scoreMessage)
                }
        }
    }
    
    func checkAnswer(_ number: Int) {
        if number == correctAnswer && question < 5{
            scoreTitle = "Yippie!!😄😄"
            scoreMessage = "You've got 1 point"
            score += 1
            question += 1
        }else if number != correctAnswer && question < 5{
            scoreTitle = "Whoops!!😡😡"
            scoreMessage = "That was \(countries[number])'s flag."
            score += 0
            question += 1
        }
        if question >= 5 {
            scoreTitle = "That's the end of the round!"
            scoreMessage = "You earned \(score) points."
            round += 1
            resetGame()
        }
        showingScore = true
    }
    
    func nextQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
    func resetGame() {
        score = 0
        question = 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//ZStack(alignment: .top) {
//
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//
//            }
//            Text("My own predefined Text")
//                .foregroundColor(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }




//LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)

//        LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: .white, location: 0.45), Gradient.Stop(color: .black, location: 0.55)]), startPoint: .top, endPoint: .bottom)
//            .ignoresSafeArea()

//        RadialGradient(gradient: Gradient(colors: [.blue, .black, .gray]), center: .center, startRadius: 20, endRadius: 200).ignoresSafeArea()


//        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
//            .ignoresSafeArea()



//Button{}label: {
//                Image(systemName: "pencil")
//            }
//                .buttonStyle(.bordered)
//            Button(role: .destructive) {deletePress()}label: {
//                Label("Delete", systemImage: "cross.case.fill")
//            }
//
//                .buttonStyle(.bordered)
//            Button("Button 3") {}
//                .buttonStyle(.borderedProminent)
//                .tint(.mint)



//Button("PopUp Alert") {
//            showAlert = true
//        }.alert("Important", isPresented: $showAlert) {
//            Button {
//
//            } label: {
//                Text("OK")
//            }
//
//            Button("Dismiss") {
//
//            }
//
//        }message: {
//            Text("Please read the contents before proceeding further")
//        }
