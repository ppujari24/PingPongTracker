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
        return PointsSelectionView()
    }
}
