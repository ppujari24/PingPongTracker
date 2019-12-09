//
//  PointsSelectionView.swift
//  PingPong0.1 WatchKit Extension
//
//  Created by Pooja Pujari on 6/4/19.
//  Copyright © 2019 Pooja. All rights reserved.
//

import SwiftUI

struct PointsSelectionView : View {
    var scoreController: ScoreController = ScoreController()
    
    var body: some View {
        List {
            NavigationLink(destination: GameSelectionView(points: ._11)
                .environmentObject(scoreController))
            {
                Text("11 points game")
                    .frame(height: 90)
            }
            .listRowPlatterColor(Color(#colorLiteral(red: 153.0 / 255.0, green: 35.0 / 255.0,
            blue: 29.0 / 255.0, alpha: 1.0)))
            NavigationLink(destination: GameSelectionView(points: ._21)
                .environmentObject(scoreController))
            {
                Text("21 points game")
                    .frame(height: 90)
            }
            .listRowPlatterColor(Color(#colorLiteral(red: 150.0 / 255.0, green: 10.0 / 255.0,
            blue: 47.0 / 255.0, alpha: 1.0)))
            }
        .navigationBarTitle(Text("Select!"))
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        PointsSelectionView()
    }
}
#endif
