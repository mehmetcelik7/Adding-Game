//
//  VTextImage.swift
//  Adding Game
//
//  Created by mehmet Çelik on 11.03.2025.
//

import SwiftUI


struct VTextImage: View {
    
    let imageName: String
    let text: LocalizedStringKey
    let dim: Double
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: dim,height: dim)
            
            Text(text)
                .fixedSize(horizontal: true, vertical: false)
                .font(.headline)
                .foregroundColor(.white)
                .fontWeight(.bold)
            
        }
        .frame(maxWidth: .infinity)
    }
}
#Preview {
    VTextImage(imageName: "creature0", text: "Rank", dim: 50)
}
