//
//  ScoreView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/5/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI


protocol ScoreControllerDelegation {
    func didFinishGame(_ controller: ScoreController)
}


struct ScoreView : View {
    @State var player1Total: UInt = 0
    @State var player2Total: UInt = 0
    @State var player1Name: Player = ""
    @State var player2Name: Player = ""
    
    let scoreController: ScoreController
    let scoreControllerDelegate: ScoreControllerDelegation?
    
    init(pointsAndGames: PointsAndGames, delegate: ScoreControllerDelegation?) {
        self.scoreController = ScoreController(pointsAndGames: pointsAndGames)
        self.scoreControllerDelegate = delegate
    }
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField($player1Name,
                              placeholder: Text(self.scoreController.player1Name),
                              onCommit: { self.scoreController.player1Name = self.player1Name })
                    Button(action: {
                        self.player1Total = self.player1Total + 1
                        self.scoreController.player1Score = self.player1Total
                        self.checkScore()
                    }) {
                        Text("\(self.player1Total)").font(.subheadline)
                    }
                }
                Spacer()
                VStack {
                    TextField($player2Name,
                              placeholder: Text(self.scoreController.player2Name),
                              onCommit: { self.scoreController.player2Name = self.player2Name })
                    Button(action: {
                        self.player2Total = self.player2Total + 1
                        self.scoreController.player2Score = self.player2Total
                        self.checkScore()
                    }) {
                        Text("\(self.player2Total)").font(.subheadline)
                    }
                }
            }
            
            Spacer()
            Text("#games: \(scoreController.numberOfGames)").lineLimit(0).font(.footnote)
            Text("#Points/game: " + scoreController.pointsPerGame.text).lineLimit(0).font(.footnote)
        }
    }
    
    
    func checkScore() {
        guard scoreController.didGameFinish else {
            return
        }
        scoreControllerDelegate?.didFinishGame(scoreController)
    }
}

#if DEBUG
struct ScoreView_Previews : PreviewProvider {
    static var previews: some View {
        ScoreView(pointsAndGames: (._11, 3), delegate: nil)
    }
}
#endif
