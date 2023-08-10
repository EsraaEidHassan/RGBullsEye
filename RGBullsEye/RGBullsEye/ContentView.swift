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
    var body: some View {
        VStack {
            Color(rgbStruct: game.target)
            Text("R: ??? G: ??? B: ???").padding()
            Color(rgbStruct: guess)
            Text(guess.intString()).padding()
            ColorSlider(value: $guess.red, trackColor: .red)
            ColorSlider(value: $guess.green, trackColor: .green)
            ColorSlider(value: $guess.blue, trackColor: .blue)
            Button("textt") {
                
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

