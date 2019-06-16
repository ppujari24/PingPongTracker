//
//  HostingController.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/4/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController : WKHostingController<PointsSelectionView> {
    override var body: PointsSelectionView {
        return PointsSelectionView(pointsDelegate: self)
    }
}


extension HostingController : PointsDelegation {
    func didSelect(points: PointsPerGame) {
        pushController(withName: "GameSelectController", context: points)
    }
}


class GameSelectController: WKHostingController<GameSelectionView> {
    var points: PointsPerGame!
    
    override func awake(withContext context: Any?) {
        guard let pointsContext = context as? PointsPerGame else {
            return
        }
        points = pointsContext
    }
    
    override var body: GameSelectionView {
        return GameSelectionView(points: points, gamesDelegate: self)
    }
}


typealias PointsAndGames = (PointsPerGame, NumberOfGames)
extension GameSelectController : GamesDelegation {
    func didSelect(points: PointsPerGame, numberOfGames: NumberOfGames) {
        let pointsAndGames: PointsAndGames = (points, numberOfGames)
//        presentController(withName: "ScoreViewController", context: pointsAndGames)
        pushController(withName: "ScoreViewController", context: pointsAndGames)
    }
}


class ScoreViewController: WKHostingController<ScoreView> {
    var points: PointsPerGame!
    var numberOfGames: NumberOfGames!
    
    override func awake(withContext context: Any?) {
        guard let pointsAndGames = context as? PointsAndGames else {
            return
        }
        points = pointsAndGames.0
        numberOfGames =  pointsAndGames.1
    }
    
    
    override var body: ScoreView {
        return ScoreView(pointsAndGames: (points, numberOfGames), delegate: self)
    }
    
    
//    func presentDismissAlert() {
//        let dismissAction = WKAlertAction(title: "End game!", style: .destructive, handler: { self.dismiss() })
//        let continueAction = WKAlertAction(title: "Cancel", style: .cancel, handler: {})
//        presentAlert(withTitle: "End game?",
//                     message: "Do you wish to end the current game?",
//                     preferredStyle: .alert, actions: [dismissAction, continueAction])
//    }
}


extension ScoreViewController: ScoreControllerDelegation {
    func didFinishGame(_ controller: ScoreController) {
        let action = WKAlertAction(title: "Close", style: .cancel,
                                   handler: {
                                    self.popToRootController()
        })
        presentAlert(withTitle: "Congrats!", message: "\(controller.winner!) wins.", preferredStyle: .alert, actions: [ action ])
    }
}
