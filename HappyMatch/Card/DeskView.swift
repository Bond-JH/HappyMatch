//
//  DeskView.swift
//  HappyMatch
//
//  Created by 杨家豪 on 2025/7/25.
//

import SwiftUI

struct DeskView:View {
    let gameRule = GameRule.shared
    @State var cards:Int = 0
    @State var Cards:[CardModel]=[]
    let columns = [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16)
        ]
    var body: some View {
        VStack{
           
            ScrollView {
                           
                            LazyVGrid(columns: columns, spacing: 16) {
                                ForEach(Cards) { model in
                                    CardView(cardModel: model)
                                }
                            }
                            .padding(16)
                        }
            Text("\(gameRule.scores)")
            Button(action: {
                cards+=1
                let newNumber=gameRule.generateRandomNumber()
                Cards.append(CardModel(number: newNumber))
                print(newNumber)
            }){
                Text("添加卡牌")
            }
        }
    }
    
    
}



#Preview {
    DeskView()
}
