//
//  ResultsView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 12/26/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI


struct ResultsView: View {
    let winner: Player
    let didEndTournament: Bool
    
    
    var body: some View {
        VStack {
            Divider()
            
            if didEndTournament {
                Text("\(winner.name) won by \(winner.numberOfGamesWon) games!").lineLimit(3)
            } else {
                Text("\(winner.name) won this game!").lineLimit(3)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Results")
        .font(.headline)
        .lineLimit(3)
    }
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(winner: Player("Pooja"), didEndTournament: false)
    }
}
