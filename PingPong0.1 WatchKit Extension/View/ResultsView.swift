//
//  ResultsView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 12/26/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI


struct ResultsView: View {
    @EnvironmentObject
    var scoreController: ScoreController
    
    var winner : Player? {
        return scoreController.winner
    }
    
    
    var tournamentWinner: Player? {
        return scoreController.tournamentWinner
    }
    
    
    var body: some View {
        VStack {
            Text("Results")
            Divider()
            
            if scoreController.didFinishTournament {
                Text("\(tournamentWinner?.name ?? "") won by \(winner?.numberOfGamesWon ?? 0) games!")
                    .lineLimit(3)
            } else {
                Text("\(winner?.name ?? "") won this game!")
                    .lineLimit(3)
            }
            
            Button(action: {
                self.scoreController.resetCurrentGameStats()
                if self.scoreController.didFinishTournament {
                    WKHostingController<PointsSelectionView>.reloadRootControllers(
                        withNamesAndContexts: [(name: "HostingController",
                                                context: [:] as AnyObject)]
                    )
                }
            }) {
                Text("Done")
                    .font(.footnote)
            }
            .accentColor(.green)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationBarTitle("")
        .font(.headline)
    }
}


struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView().environmentObject(ScoreController())
    }
}