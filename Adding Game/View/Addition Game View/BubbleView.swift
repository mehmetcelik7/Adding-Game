//
//  BubbleView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct BubbleView: View {
    let bubbleSize:CGFloat = 200.0
    let textColor: Color
    let bgColor: Color
    let name: String
    let text: String
    
    @State private var rotate = 0.0
    
    
    var body: some View {
        
            Text(text)
                .foregroundColor(textColor)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
                .background(
                    Image(name)
                        .resizable()
                        .scaledToFill()
                        .opacity(0.9)
                        .rotationEffect(Angle(degrees: rotate))
                        .background(bgColor)
                        .clipShape(Circle())
                )
                .padding()
                .onAppear {
                    withAnimation(
                        .linear(duration: 5)
                        .repeatForever(autoreverses: false)) {
                        rotate = 360

                    }
                }
    }
}

#Preview {
    VStack{
        BubbleView(textColor: .white, bgColor: .purple.opacity(0.4), name: "bubble", text: "25")
        BubbleView(textColor: .white, bgColor: .purple.opacity(0.4), name: "bubble1", text: "25")
        BubbleView(textColor: .white, bgColor: .purple.opacity(0.4), name: "bubble1", text: "25")
        BubbleView(textColor: .white, bgColor: .purple.opacity(0.4), name: "bubble1", text: "25")
        BubbleView(textColor: .white, bgColor: .purple.opacity(0.4), name: "bubble2", text: "25")
    }
}
