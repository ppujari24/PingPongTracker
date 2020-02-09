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
    let notificationCenter = NotificationCenter.default
    
    override func awake(withContext context: Any?) {
        notificationCenter.addObserver(self,
                                       selector: #selector(shouldDismissResultView),
                                       name: .didFinishGame,
                                       object: nil)
    }
    
    
    override var body: PointsSelectionView {
        return PointsSelectionView()
    }
}


private extension HostingController {
    @objc func shouldDismissResultView() {
        dismiss()
    }
}


extension NSNotification.Name {
    static let didFinishGame = NSNotification.Name("ResultsView.didFinishGame")
}
