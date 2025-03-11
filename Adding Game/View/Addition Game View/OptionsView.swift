//
//  OptionsView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct OptionsView: View {
    let gameVM: AdditionGameViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(gameVM.possibleSolutions, id: \.self) { option in
                
               
                
                BubbleView(
                    textColor: .black,
                    bgColor: .purple.opacity(0.7),
                    name: "bubble2",
                    text: "\(option)")
                .onTapGesture {
                    withAnimation {
                        if gameVM.answer == option {
                            gameVM.increaseScore()
                        }else{
                            gameVM.loseLife()
                        }
                        gameVM.generateNumbers()
                    }
                }
            }
           

        }
    }
}

#Preview {
    OptionsView(gameVM: AdditionGameViewModel())
}
