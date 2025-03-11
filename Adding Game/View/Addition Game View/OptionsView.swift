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
                
               
                SelecButton(option: option, gameVM: gameVM)
             
            }
           

        }
    }
}

struct SelecButton: View {
    let option: Int
    @State var selectedOption: Int? = nil
    var isSelected: Bool {
        selectedOption == option
    }
    
    var scale:CGFloat {
        isSelected ? 1.2 : 1.0
    }
    
    var color : Color {
        isSelected ? getRandomColor()  : .pink.opacity(0.7)
    }
    
    func getRandomColor()-> Color {
        [.green.opacity(0.7),.red,.blue,.yellow,.brown]  .randomElement() ?? .green.opacity(0.7)
    }
    let gameVM: AdditionGameViewModel
    
    var body: some View {
        
        BubbleView(
            textColor: .black,
            bgColor: color,
            name: "bubble2",
            text: "\(option)")
        .scaleEffect(scale)
        .onTapGesture {
            
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3).repeatCount(1,autoreverses: true)) {
                selectedOption = option
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    selectedOption = nil
                }
            }
            
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

#Preview {
    OptionsView(gameVM: AdditionGameViewModel())
}
