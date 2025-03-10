//
//  TitleValueView.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import SwiftUI

struct TitleValueView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(title)
            Text("\(value)")
        }
        .font(.headline)
        .fontWeight(.bold)
        .foregroundColor(.white)
    }
}

#Preview {
    ZStack {
        GameBackgroundView()
        TitleValueView(title: "Score", value: 7)
    }
}
