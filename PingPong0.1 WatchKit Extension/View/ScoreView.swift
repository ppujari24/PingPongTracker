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
    @State private var player1Total: UInt = 0 {
        didSet {
            self.scoreController.player1Score = self.player1Total
            self.checkScore()
        }
    }
    
    @State private var player2Total: UInt = 0
    @State private var player1Name: Player = "Player 1"
    @State private var player2Name: Player = "Player 2"
    
    @EnvironmentObject
    var scoreController: ScoreController
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                VStack {
                    TextField("Player 1 name",
                              text: $player1Name,
                              onCommit: { self.scoreController.player1Name = self.player1Name })
                    Button(action: { self.player1Total += 1 }) {
                        Text("\(player1Name)")
                    }
                }
                
                VStack {
                    TextField("Player 2 name",
                              text: $player2Name,
                              onCommit: { self.scoreController.player2Name = self.player2Name })
                    Button(action: { self.player2Total += 1 }) {
                        Text("\(player2Name)")
                    }
                }
            }
//            HStack {
//                VStack {
//                    TextField($player1Name,
//                              placeholder: Text(self.scoreController.player1Name),
//                              onCommit: { self.scoreController.player1Name = self.player1Name })
//                    Button(action: {
//                        self.player1Total = self.player1Total + 1
//                        self.scoreController.player1Score = self.player1Total
//                        self.checkScore()
//                    }) {
//                        Text("\(self.player1Total)").font(.subheadline)
//                    }
//                }
//                Spacer()
//                VStack {
//                    TextField($player2Name,
//                              placeholder: Text(self.scoreController.player2Name),
//                              onCommit: { self.scoreController.player2Name = self.player2Name })
//                    Button(action: {
//                        self.player2Total = self.player2Total + 1
//                        self.scoreController.player2Score = self.player2Total
//                        self.checkScore()
//                    }) {
//                        Text("\(self.player2Total)").font(.subheadline)
//                    }
//                }
//            }
//
//            Spacer()
//            Text("#games: \(scoreController.numberOfGames)").lineLimit(0).font(.footnote)
//            Text("#Points/game: " + scoreController.pointsPerGame.text).lineLimit(0).font(.footnote)
        }
    }
    
    
    func checkScore() {
        guard scoreController.didGameFinish else {
            return
        }
//        scoreControllerDelegate?.didFinishGame(scoreController)
    }
}

#if DEBUG
struct ScoreView_Previews : PreviewProvider {
    static var previews: some View {
        ScoreView().environmentObject(ScoreController())
    }
}
#endif
