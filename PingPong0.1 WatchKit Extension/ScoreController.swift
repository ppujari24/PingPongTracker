//
//  ScoreController.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/6/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

typealias Player = String


class ScoreController {
    let pointsPerGame: PointsPerGame
    let numberOfGames: NumberOfGames
    
    init(pointsAndGames: PointsAndGames) {
        self.pointsPerGame = pointsAndGames.0
        self.numberOfGames = pointsAndGames.1
    }
    
    var player1Name: Player = "Player 1"
    var player2Name: Player = "Player 2"
    
    var player1Score: UInt = 0
    var player2Score: UInt = 0
    
    
    var isDuece: Bool {
        // not yet handled
        return false
    }
    
    
    var didGameFinish: Bool {
        return player1Score + player2Score == pointsPerGame.rawValue
    }
    
    
    var currentlyLeadingPlayer: Player {
        return player2Score > player1Score ? player2Name : player1Name
    }
    
    
    var currentlyLosingPlayer: Player {
        return player2Score < player1Score ? player2Name : player1Name
    }
    
    
    var winner: Player? {
        guard didGameFinish else {
            return nil
        }
        return currentlyLeadingPlayer
    }
    
    
    var loser: Player? {
        guard didGameFinish else {
            return nil
        }
        return currentlyLosingPlayer
    }
}
