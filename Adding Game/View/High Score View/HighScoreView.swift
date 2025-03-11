//
//  HighScoreView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct HighScoreView: View {
    
    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    
    var body: some View {
        ZStack {
            HighScoreBackgroundView()
            VStack {
                HighScoreTitle()
                List{
                    ForEach(Array(highScoreVM.highScores.enumerated()), id: \.offset) {
                        index, entity in
                        
                        Text("\(index + 1) \(entity.score) GET NAME" )
                        RankScoreView(
                            rank: index + 1,
                            score: Int(entity.score),
                            entity: entity
                        )
                    }
                    .onDelete(perform: highScoreVM.deleteScore)
                    .listRowBackground(Color.black)
                }
                .listStyle(.plain)
                Image("creature0")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
            
        }
    }
}

struct RankScoreView: View {
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    var color: Color {
        scoreColors[(rank - 1 % scoreColors.count)]
    }
    let scoreColors: [Color] = [
        .blue,.pink,.yellow,.green,.red,.orange,.purple,.teal
    ]
    @State private var editMode = false
    
    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    
    @State private var name: String = ""
    @State private var save = false
    var body: some View {
        VStack {
            if editMode {
                HStack {
                    TextField(entity.name ?? "Name", text: $name)
                        .padding()
                        .background(.green.gradient)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    
                    Button(action: {
                        highScoreVM.updateHighScore(entity: entity, name: name.isEmpty ? (entity.name ?? "Anon") : name)
                        withAnimation {
                            editMode.toggle()
                        }
                    }, label: {
                        Text("Save")
                            .foregroundColor(.white)
                            .padding()
                            .background(.red.gradient)
                            .cornerRadius(10)
                    })
                }
            }else{
                
                HStack {
                    Text(rank.ordinal)
                        .frame(width: .infinity)
                    
                    Text("\(score)")
                        .frame(width: .infinity)

                    Text(entity.name?.uppercased() ?? "")
                        .frame(width: .infinity)
            }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(color)
                .onTapGesture {
                    withAnimation {
                        editMode.toggle()
                    }
                }
          }
        }
    }
}

#Preview {
    HighScoreView()
        .environmentObject(HighScoreViewModel())
}
