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

    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack {
            BackgroundView(colorList: [.blue, .purple], opacity: 1)
            VStack {
                Text("New High Score!")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("\(score)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                
                TextField("Name", text: $name)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding()
                
                Button(action: {
                    name = name.isEmpty ? "Anon" : name
                   
                    
                    modelContext
                        .insert(HighScoreEntity(name: name, score: score))
                    isPresented = false
                }, label: {
                    Text("Save")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
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
    .modelContainer(for: HighScoreEntity.self)
}
