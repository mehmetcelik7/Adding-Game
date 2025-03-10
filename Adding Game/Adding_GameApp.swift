//
//  Adding_GameApp.swift
//  Adding Game
//
//  Created by mehmet Çelik on 9.03.2025.
//

import SwiftUI

@main
struct Adding_GameApp: App {
    
    @StateObject var highScoreVM = HighScoreViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(highScoreVM)
        }
    }
}
