//
//  InfoView.swift
//  Bullseye
//
//  Created by Naji Achkar on 08/10/2019.
//  Copyright © 2019 Hquart. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        VStack {
            Text("Rules are simple:\n Move the slider as close as you can to the TARGET number displayed on top \n If it's a match, you win 10 points, the closer you are, more points you get \n The Game is composed of 5 Rounds \n At any time, press RESET button to start a new game")
            Spacer()
       
           
}
}
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
