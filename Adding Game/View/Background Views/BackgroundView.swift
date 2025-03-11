//
//  BackgroundView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct BackgroundView: View {
    let colorList: [Color]
    let opacity: Double
    
    var body: some View {
        LinearGradient(colors: colorList, startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .opacity(opacity)
    }
}

struct GameBackgroundView: View {
    var body: some View {
        BackgroundView(colorList: [.red,.yellow,.blue,.pink], opacity: 0.7)
    }
}

struct HighScoreBackgroundView: View {
    var body: some View {
        BackgroundView(colorList: [.black,.black,.gray], opacity: 0.7)
    }
}

#Preview {
    GameBackgroundView()
    HighScoreBackgroundView()
}
