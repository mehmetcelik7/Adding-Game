//
//  GameOverView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        HStack {
            
            Label(title: {
                Text("Game Over")
                    .multilineTextAlignment(.center)
                Image(systemName: "arrowshape.turn.up.backward.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.yellow)
            }, icon: {
                Image(Creatures.creature2.rawValue)
                    .resizable()
                    .frame(width: 75, height: 75)
                    .scaledToFit()
                    .padding()
                    .background(.blue.opacity(0.9))
                    .clipShape(Circle())
            })
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 75))
            .shadow(color: .cyan.opacity(0.8) ,radius: 5, x: 0, y: 15)
            
            
            
        }
    }
}

#Preview {
    GameOverView()
}
