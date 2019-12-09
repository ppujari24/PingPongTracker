//
//  GameSelectionView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/5/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI

protocol GamesDelegation {
    func didSelect(points: PointsPerGame, numberOfGames: UInt)
}

typealias NumberOfGames = UInt
struct GameSelectionView : View {
    let points: PointsPerGame
    
    @EnvironmentObject
    var scoreController: ScoreController

    @State
    var numberOfGames: NumberOfGames = 1
    
    
    var body: some View {
        VStack {
            Text("Select # of games below:").lineLimit(2).font(.headline)
            
            Spacer()
            
            HStack {
                Button(action: {
                    if self.numberOfGames > 1 {
                        self.numberOfGames = self.numberOfGames - 1
                    }
                }) {
                    Text("-")
                }
                Text("\(numberOfGames)").bold().font(.headline)
                Button(action: {
                    self.numberOfGames = self.numberOfGames + 1
                }) {
                    Text("+")
                }
            }
            
            Spacer()

            NavigationLink(destination: ScoreView().environmentObject(scoreController)) {
                Text("PLAY")
            }.onTapGesture {
                self.scoreController.update(pointsPerGame: self.points,
                                            numberOfGames: self.numberOfGames)
            }
        }.navigationBarTitle("Select games!")
    }
}

#if DEBUG
struct GameSelectionView_Previews : PreviewProvider {
    static var previews: some View {
        GameSelectionView(points: ._11).environmentObject(ScoreController())
    }
}
#endif
