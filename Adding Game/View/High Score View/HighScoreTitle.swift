//
//  HighScoreTitle.swift
//  Adding Game
//
//  Created by mehmet Çelik on 11.03.2025.
//

import SwiftUI

struct HighScoreTitle: View {
    var body: some View {
        
        HStack{
            VTextImage(imageName: "creature0", text: "Rank", dim: 25)
            VTextImage(imageName: "creature1", text: "Score", dim: 25)
            VTextImage(imageName: "creature2", text: "Name", dim: 25)


        }
        .padding(.horizontal)
    }
}




#Preview {
    HighScoreTitle()
}
