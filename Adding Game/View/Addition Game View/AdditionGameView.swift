//
//  AdditionGameView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct AdditionGameView: View {
    @State private var gameVM = AdditionGameViewModel()
    
    var body: some View {
        ZStack {
            GameBackgroundView()
            VStack {
                ScoreLivesView(score: gameVM.score, lives: gameVM.gameModel.lives, maxLives: 3, level: gameVM.gameModel.level)
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    AdditionGameView()
}
