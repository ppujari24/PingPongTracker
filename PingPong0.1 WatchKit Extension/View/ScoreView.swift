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
    @State private var player1Name: Player = "Player 1"
    @State private var player2Name: Player = "Player 2"
    @State private var didEndGame = false
    
    @EnvironmentObject
    var scoreController: ScoreController
    
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    TextField("Player 1 name",
                              text: $player1Name,
                              onCommit: { self.scoreController.player1Name = self.player1Name })
                    Spacer()
                    
                    Button(action: {
                        self.scoreController.player1Score += 1
                        self.didEndGame = self.scoreController.didGameFinish
                    }) {
                        Text("\(scoreController.player1Score)")
                            .font(.largeTitle)
                            .frame(width: nil, height: 112, alignment: .leading)
                    }
                    .shadow(color: .white, radius: 1, x: 0, y: 1)
                }
                
                Divider()
                
                VStack {
                    TextField("Player 2 name",
                              text: $player2Name,
                              onCommit: { self.scoreController.player2Name = self.player2Name })
                    
                    Spacer()
                    
                    Button(action: {
                        self.scoreController.player2Score += 1
                        self.didEndGame = self.scoreController.didGameFinish
                    }) {
                        Text("\(scoreController.player2Score)")
                            .font(.largeTitle)
                            .frame(width: nil, height: 112, alignment: .leading)
                    }
                    .shadow(color: .white, radius: 1, x: 0, y: 1)
                }
            }.sheet(isPresented: $didEndGame, onDismiss: {
                
            }) {
                return ResultsView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("#games: \(scoreController.numberOfGames)").font(.footnote)
    }
}


struct ResultsView: View {
    var body: some View {
        return Text("YOU WON!")
    }
}

#if DEBUG
struct ScoreView_Previews : PreviewProvider {
    static var previews: some View {
        ScoreView().environmentObject(ScoreController())
    }
}
#endif
