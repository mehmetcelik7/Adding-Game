//
//  Test Localize.swift
//  Adding Game
//
//  Created by mehmet Çelik on 9.03.2025.
//

import SwiftUI

struct Test_Localize: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game Over")
            Text("Score")
            Text("Level")
            Text("High Scores")
            Text("Rank")
            Text("Name")
            Text("Save")
        }
        .font(.title)
    }
}

#Preview {
    Test_Localize()
}
