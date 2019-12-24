//
//  AboutView.swift
//  Bullseye
//
//  Created by Naji Achkar on 14/10/2019.
//  Copyright © 2019 Hquart. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
            VStack {
                Text("🥏 Slider Game 🥏")
                    .font(Font.custom("Arial Rounded MT Bold", size: 30))
                    .foregroundColor(.white)
                    .bold()
                    .background(Color.black)
                Divider()
                Text("Bonjour et bienvenue au jeu du Slider \n Le jeu est simple, il suffit de placer le curseur le plus proche possible de la valeur cible \n Plus vous êtes proche, plus vous gagnez de points \n La partie se déroule sur 5 Rounds \n GOOD LUCK !")
                    .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.orange)
                                .font(.headline)
                    .lineLimit(10)
                    .background(Color.black)
            }
            .background(Image("nightback"))
            .accentColor(.white)
            .navigationBarTitle("About Slider")
    }

}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}

