//
//  Adding_GameApp.swift
//  Adding Game
//
//  Created by mehmet Çelik on 9.03.2025.
//

import SwiftUI

@main
struct Adding_GameApp: App {
    
    @State var highScoreVM = HighScoreViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(highScoreVM)
        }
    }
}
