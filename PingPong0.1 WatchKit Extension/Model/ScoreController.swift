//
//  ScoreController.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/6/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation

typealias Player = String


final class ScoreController : ObservableObject {
    private(set) var pointsPerGame: PointsPerGame = ._11
    private(set) var numberOfGames: NumberOfGames = 3
    
    func update(pointsPerGame: PointsPerGame, numberOfGames: NumberOfGames) {
        self.pointsPerGame = pointsPerGame
        self.numberOfGames = numberOfGames
    }
    
    @Published var player1Name: Player = "Player 1"
    @Published var player2Name: Player = "Player 2"
    
    @Published var player1Score: UInt = 0
    @Published var player2Score: UInt = 0
    
    
    var isDuece: Bool {
        // not yet implemented
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



enum PointsPerGame: UInt, CaseIterable {
    case _11 = 11
    case _21 = 21
    
    typealias RawValue = UInt
    
    var text: String {
        switch self {
        case ._11:
            return "11 points game"
        case ._21:
            return "21 points game"
        }
    }
}

