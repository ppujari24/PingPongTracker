//
//  ScoreController.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/6/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation


final class ScoreController : ObservableObject {
    private(set) var pointsPerGame: PointsPerGame = ._11
    
    func update(pointsPerGame: PointsPerGame, numberOfGames: NumberOfGames) {
        self.pointsPerGame = pointsPerGame
        self.numberOfGames = numberOfGames
    }
    
    @Published var numberOfGames: NumberOfGames = 1
    
    @Published var player1: Player = Player("Player 1")
    @Published var player2: Player = Player("Player 2")
    
    @Published var player1Score: UInt = 0 {
        didSet {
            self.player1.score = player1Score
        }
    }
    @Published var player2Score: UInt = 0 {
        didSet {
            self.player2.score = player2Score
        }
    }
    
    @Published var didFinishTournament: Bool = false
    
    var isDuece: Bool {
        let finalScoreMinusOne = pointsPerGame.rawValue - 1
        return player1Score == finalScoreMinusOne && player2Score == finalScoreMinusOne
    }
    
    
    var didGameFinish: Bool {
        let finalScore = pointsPerGame.rawValue
        let didGameFinish = player1Score == finalScore || player2Score == finalScore
        return didGameFinish
    }
    
    
    var currentlyLeadingPlayer: Player {
        return player2Score > player1Score ? player2 : player1
    }
    
    
    var currentlyLosingPlayer: Player {
        return player2Score < player1Score ? player2 : player1
    }
    
    
    var winner: Player? {
        guard didGameFinish else {
            return nil
        }
        return currentlyLeadingPlayer
    }
    
    
    var tournamentWinner: Player? {
        guard didFinishTournament else {
            return winner
        }
        return player1.numberOfGamesWon > player2.numberOfGamesWon ? player1 : player2
    }
}


extension ScoreController {
    func resetCurrentGameStats() {
        if player1Score > player2Score {
            player1.numberOfGamesWon += 1
        } else {
            player2.numberOfGamesWon += 1
        }
        
        player1Score = 0
        player2Score = 0
        if numberOfGames > 0 {
            numberOfGames -= 1
        } else if numberOfGames == 0 {
            resetTournament()
        }
    }
    
    
    func resetTournament() {
        didFinishTournament = true
        
        update(pointsPerGame: ._11, numberOfGames: 1)
        
        player1.update(name: "Player 1")
        player2.update(name: "Player 2")
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

