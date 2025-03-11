//
//  ContentView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 9.03.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView {
            AdditionGameView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            HighScoreView()
                .tabItem {
                    Image(systemName: "list.number")
                    Text("High Scores")
                }
       }
    }
}

#Preview {
    MainView()
        .environment(HighScoreViewModel())
}
