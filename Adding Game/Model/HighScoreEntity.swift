//
//  HighScoreEntity.swift
//  Adding Game
//
//  Created by mehmet Çelik on 11.03.2025.
//

import SwiftUI
import SwiftData

@Model
class HighScoreEntity: Identifiable {
    let id = UUID()
    var name: String
    let score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

