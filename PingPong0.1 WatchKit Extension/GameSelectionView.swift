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
    let gamesDelegate: GamesDelegation?
    @State var numberOfGames: NumberOfGames = 1
    var body: some View {
        VStack {
            Text("Select # of games below:").lineLimit(0).font(.headline)
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
            Button(action: {
                self.gamesDelegate?.didSelect(points: self.points, numberOfGames: self.numberOfGames)
            }) {
                Text("PLAY")
            }
        }
    }
}

#if DEBUG
struct GameSelectionView_Previews : PreviewProvider {
    static var previews: some View {
        GameSelectionView(points: ._11, gamesDelegate: nil)
    }
}
#endif
