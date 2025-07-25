//
//  CardView.swift
//  HappyMatch
//
//  Created by 杨家豪 on 2025/7/25.
//

import SwiftUI
struct CardView:View {
    let gameRule = GameRule.shared
    let cardModel:CardModel
   
    
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 6)
            Image(systemName: gameRule.choosePattern(id: gameRule.getPattern(n: cardModel.number)))
                .scaleEffect(3)
        }
        .frame(width: 120, height: 180)
    }
}

struct CardModel:Identifiable{
    let id = UUID()
    let number:Int
}

