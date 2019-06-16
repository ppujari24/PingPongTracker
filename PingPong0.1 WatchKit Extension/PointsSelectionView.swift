//
//  PointsSelectionView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/4/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI

enum PointsPerGame: UInt, CaseIterable {
    case _11 = 11
    case _21 = 21
    
    var text: String {
        switch self {
        case ._11:
            return "11"
        case ._21:
            return "21"
        }
    }
}

protocol PointsDelegation {
    func didSelect(points: PointsPerGame)
}

struct PointsSelectionView : View {
    let pointsDelegate: PointsDelegation?
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Select points for a game.").font(.subheadline).lineLimit(0)
            Button(action: { self.pointsDelegate?.didSelect(points: ._11) }) { Text("11") }
            Spacer()
            Button(action: { self.pointsDelegate?.didSelect(points: ._21) }) { Text("21") }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        PointsSelectionView(pointsDelegate: nil)
    }
}
#endif
