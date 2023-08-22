//
//  ContentView.swift
//  RGBullsEye
//
//  Created by JETS-Mobile Lab on 09/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State var game : Game = Game()
    @State var guess : RGB
    @State var showScore = false
    var body: some View {
        VStack {
            ColorCircle(color: game.target)
            if !showScore {
                Text("R: ??? G: ??? B: ???").padding()
            } else {
                Text(game.target.intString()).padding()
            }
            ColorCircle(color: guess)
            Text(guess.intString()).padding()
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)
            Button("Hit Me!") {
                showScore = true
                game.check(guess: guess)
                
            }.alert(isPresented: $showScore) {
                Alert(title: Text("Your Score"),
                      message: Text(String(game.scoreRound)),
                      dismissButton: .default(Text("OK")){
                    game.startNewRound()
                    guess = RGB()
                }
                )
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(guess: RGB())
    }
}


struct ColorSlider: View {
    @Binding var value : Double
    var trackColor : Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .padding(.horizontal)
    }
}

struct ColorCircle: View{
    var color : RGB
    var body: some View{
        Circle()
            .fill(Color(rgbStruct: color))
    }
}

