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
    @State var clicked=false
    var  card:Card{
        Card(identity: gameRule.getPattern(n: cardModel.number))
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(lineWidth: 6)
                .foregroundColor(clicked ? .blue : .black)
            Image(systemName: gameRule.choosePattern(id: gameRule.getPattern(n: cardModel.number)))
                .scaleEffect(3)
        }
        .frame(width: 120, height: 180)
        .gesture(option)
     
       
        
    }
    
    var option:some Gesture{
        TapGesture()
            .onEnded{
                
                if(!clicked){
                    if(gameRule.choosenCards.count<2){
                        gameRule.choose(c: card)
                    }
                    
                }else{
                    gameRule.cancel(c: card, status: clicked)
                }
                
                
               
                gameRule.succeed()
                self.clicked.toggle()
                
               
            }
        
        
    }
    
//    var match : some Gesture{
//        TapGesture()
//            .onEnded{
//                if(self.clicked){
//                    gameRule.choose(c: card)
//                }
//            }
//    }
    

}

struct CardModel:Identifiable{
    let id = UUID()
    let number:Int
}

