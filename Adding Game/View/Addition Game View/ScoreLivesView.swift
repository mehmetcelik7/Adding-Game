//
//  ScoreLivesView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct ScoreLivesView: View {
    let score: Int
    let lives: Int
    let maxLives: Int
    let level: Int
    var body: some View {
        HStack {
          
            TitleValueView(title: "Score", value: score)
            
            Spacer()
            TitleValueView(title: "Level", value: level)
            
            Spacer()
            LivesView(imageName: .creature0, numlives: lives, maxLives: maxLives)

        }.padding()
    }
}

#Preview {
    ZStack {
        GameBackgroundView()
        ScoreLivesView(score: 22, lives: 2, maxLives: 3, level: 7)
    }
}
