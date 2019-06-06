//
//  ScoreView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/5/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI

struct ScoreView : View {
    @State var player1Total: Int = 0
    @State var player2Total: Int = 0
    @State var player1Name: String = ""
    @State var player2Name: String = ""
    
    let scoreController: ScoreController
    
    init(pointsAndGames: PointsAndGames) {
        self.scoreController = ScoreController(pointsAndGames: pointsAndGames)
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField($player1Name)
                    Button(action: {
                        self.player1Total = self.player1Total + 1
                    }) {
                        Text("\(self.player1Total)").font(.subheadline)
                    }
                }
                Spacer()
                VStack {
                    TextField($player2Name)
                    Button(action: {
                        self.player2Total = self.player2Total + 1
                    }) {
                        Text("\(self.player2Total)").font(.subheadline)
                    }
                }
            }
            
            Spacer()
            Text("#games: \(scoreController.numberOfGames) & #Points/game: " + scoreController.pointsPerGame.text).lineLimit(0).font(.footnote)
        }
    }
}

#if DEBUG
struct ScoreView_Previews : PreviewProvider {
    static var previews: some View {
        ScoreView(pointsAndGames: (._11, 3))
    }
}
#endif
