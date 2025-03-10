//
//  EnterNewHighScoreView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct EnterNewHighScoreView: View {
    
    let score: Int
    @Binding var name: String
    @Binding var isPresented: Bool
    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(colorList: [.blue,.purple], opacity: 1)
            VStack {
                Text("New High Score!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("\(score)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                TextField("Enter name", text: $name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(.white.opacity(0.8))
                    .cornerRadius(10)
                    .padding()
                
                Button(action: {
                    name = name.isEmpty ? "Anonymous" : name
                    
                    highScoreVM.addHighScore(name: name, score: Int64(score))
                    
                }, label: {
                    Text("Save")
                        .font(.title)
                        .foregroundColor(.white.opacity(0.9))
                        .padding()
                        .background(.cyan)
                        .cornerRadius(20)
                })
            }
        }
    }
}

#Preview {
    EnterNewHighScoreView(
        score: 123,
        name: .constant(""),
        isPresented: .constant(true)
    )
        .environmentObject(HighScoreViewModel())
}
