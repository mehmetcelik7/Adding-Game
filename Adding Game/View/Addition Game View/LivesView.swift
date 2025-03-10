//
//  LivesView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct LivesView: View {
    let imageName: Creatures
    let numlives: Int
    let dim = 30.0
    let maxLives: Int
    var body: some View {

        HStack {
            ForEach(0..<maxLives, id: \.self) { i in
                
                let opacity: CGFloat = i >= numlives ? 0.3 : 1.0
                Image(imageName.rawValue)
                    .resizable()
                    .scaledToFit()
                    .opacity(opacity)
                    .frame(width: dim, height: dim)
            }
        }
    }
}

#Preview {
    LivesView(imageName: .creature0, numlives: 3, maxLives: 3)
}
    
