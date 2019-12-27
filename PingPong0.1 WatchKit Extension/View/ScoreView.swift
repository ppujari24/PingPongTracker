//
//  ScoreView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/5/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI


struct ScoreView : View {
    @State private var player1Name: String = "Player 1"
    @State private var player2Name: String = "Player 2"
    @State private var didEndGame = false
    
    @EnvironmentObject
    var scoreController: ScoreController
    
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("Player 1 name",
                              text: $player1Name,
                              onCommit: { self.scoreController.player1.update(name: self.player1Name) })
                        .font(.caption)
                    Spacer()
                    
                    Divider()
                    
                    Button(action: {
                        self.scoreController.player1Score += 1
                        self.didEndGame = self.scoreController.didGameFinish
                    }) {
                        Text("\(scoreController.player1Score)")
                            .font(.largeTitle)
                            .frame(width: nil, height: 112, alignment: .leading)
                    }
                    .accentColor(.green)
                    .frame(width: nil, height: 110, alignment: .center)
                    .shadow(color: .white, radius: 1, x: 0, y: 1)
                }
                
                Divider()
                
                VStack {
                    TextField("Player 2 name",
                              text: $player2Name,
                              onCommit: { self.scoreController.player2.update(name: self.player2Name) })
                        .font(.caption)
                    
                    Spacer()
                    
                    Divider()
                    
                    Button(action: {
                        self.scoreController.player2Score += 1
                        self.didEndGame = self.scoreController.didGameFinish
                    }) {
                        Text("\(scoreController.player2Score)")
                            .font(.largeTitle)
                            .frame(width: nil, height: 112, alignment: .leading)
                    }
                    .frame(width: nil, height: 110, alignment: .center)
                    .shadow(color: .white, radius: 1, x: 0, y: 1)
                }
            }
            .sheet(isPresented: $didEndGame, onDismiss: {
                if self.scoreController.didFinishTournament {
                    let rootInterfaceController = WKExtension.shared().rootInterfaceController
                    rootInterfaceController?.popToRootController()
                } else {
                    self.scoreController.resetCurrentGameStats()
                }
            }) {
                return ResultsView(winner: self.scoreController.tournamentWinner!,
                                   didEndTournament: self.scoreController.didFinishTournament)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("#games: \(scoreController.numberOfGames)")
    }
}


#if DEBUG
struct ScoreView_Previews : PreviewProvider {
    static var previews: some View {
        ScoreView().environmentObject(ScoreController())
    }
}
#endif
