//
//  ScoreController.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/6/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

class ScoreController {
    let pointsPerGame: PointsPerGame
    let numberOfGames: NumberOfGames
    
    init(pointsAndGames: PointsAndGames) {
        self.pointsPerGame = pointsAndGames.0
        self.numberOfGames = pointsAndGames.1
    }
    
    var player1Score: UInt = 0
    var player2Score: UInt = 0
    
    
}
