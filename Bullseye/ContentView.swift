//  ContentView.swift
//  Bullseye
//
//  Created by Naji Achkar on 04/10/2019.
//  Copyright © 2019 Hquart. All rights reserved.

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible = false
    @State var finalScoreIsVisible = false
    @State var sliderValue: Double = 50
    @State var target: Int = Int.random(in: 1...100)
    @State var actualScore = 0
    @State var roundCounter = 1
    //METHODS
    
    struct LabelStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.title)
                .foregroundColor(Color.white)
                .modifier(ApplyShadow())
        } }
    struct ValueStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(.title)
                .foregroundColor(Color.red)
                .modifier(ApplyShadow())
        } }
    
    struct ApplyShadow: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .shadow(color: .white, radius: 100, x: 10, y: 10)
        }
    }
    func pointsForCurrentRound() -> Int {
        var difference: Int {
            let roundedSliderValue = Int(sliderValue.rounded())
            return abs(roundedSliderValue - target) }
        let roundScore = 10 - difference
        if roundScore < 0 {
            return 0
        } else if roundScore == 10 {
            return 15
        } else { return roundScore
        }
    }
    func alertTitle() -> String {
        let result = pointsForCurrentRound()
        switch result {
        case 10...15: return "PERFECT !"
        case 5...9: return "GREAT ONE !"
        case 1...4: return "GOOD JOB !"
        default: return "TRY AGAIN !"
        }
    }
    func dismissAlert() -> String {
        let reference = roundCounter
        switch reference {
        case 1: return "ROUND 2"
        case 2: return "ROUND 3"
        case 3: return "ROUND 4"
        case 4: return "ROUND 5"
        case 5: return "FINAL SCORE : \(actualScore)"
        default: return ""
        }
    }
    func newGame() {
        actualScore = 0
        roundCounter = 1
        target = Int.random(in: 1...100)
        sliderValue = 50
    }

    var body: some View {
      
        VStack(spacing: 15) {
            // TARGET ROW
            Spacer()
            VStack {
                Text("TARGET").modifier(LabelStyle())
                Text("\(self.target)").modifier(ValueStyle())
                Text("Round").modifier(LabelStyle())
                Text("\(roundCounter)").modifier(ValueStyle())
            }
            // ROUND ROW
            
            //SLIDER ROW
            HStack(alignment: .center, spacing: 20) {
                Text("1")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                Slider(value: $sliderValue, in: 1...100)
                    .accentColor(.red) // is synchronized with the @State var sliderValue
                Text("100")
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
            }
            //BUTTON ROW
            HStack(alignment: .center, spacing: 20) {
                Button(action: { self.alertIsVisible = true } ) {
                    Image("playblue")
                        .renderingMode(.original)
                        .font(.largeTitle)
                }
                .alert(isPresented: $alertIsVisible) { () -> Alert in
                    let roundedSliderValue: Int = Int(sliderValue.rounded())
                    return Alert(title: Text(alertTitle()) , message: Text("The slider's value is \(roundedSliderValue)\n" + "You scored \(pointsForCurrentRound())") , dismissButton: .default(Text(dismissAlert())) {
                        if self.roundCounter < 5 {
                            self.roundCounter += 1 ; self.actualScore += self.pointsForCurrentRound() ; self.target = Int.random(in: 1...100)
                        } else if self.roundCounter == 5 {
                            
                            self.newGame()
                        } } ) }
            }
            // SCORE ROW
            HStack(alignment: .center, spacing: 20) {
                Spacer()
                Button(action: {self.newGame()}) {
                    Image(systemName: "goforward")
                        .font(.title)
                    Text("Restart")
                        .modifier(ApplyShadow())
                }
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(actualScore)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    Image(systemName: "info.circle")
                        .font(.title)
                    Text("Info")
                }
                .foregroundColor(.white)
                Spacer()
            }
        }
            //END OF VSTACK
            .accentColor(.white)
            .padding(.bottom, 30)
            .padding(.top, 30)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(
                Image("nightback")
                    .resizable()
                    .edgesIgnoringSafeArea(.all))
            .navigationBarTitle("SLIDER")
                 
            
    } }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414)) // this will show the preview in fixed size landscape
    } }




