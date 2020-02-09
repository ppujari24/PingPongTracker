//
//  Player.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 12/26/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import Foundation


final class Player : NSObject {
    private(set) var name: String
    var score: UInt
    
    var numberOfGamesWon: NumberOfGames = 0
    var numberOfGamesLost: NumberOfGames = 0
    
    
    init(_ name: String) {
        self.name = name
        self.score = 0
    }
    
    
    func update(name: String) {
        self.name = name
    }
    
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.hash == rhs.hash
    }
    
    override var hash: Int {
        return name.hash
    }
}
