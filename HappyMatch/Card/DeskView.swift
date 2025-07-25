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
    @State var Cards:[CardModel] = []
    var body: some View {
        VStack{
           
            HStack{ ForEach(Cards) { model in
                CardView(cardModel: model)
                    .fixedSize()
            }
                
            }
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
