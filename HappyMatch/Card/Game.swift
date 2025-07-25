//
//  Game.swift
//  HappyMatch
//
//  Created by 杨家豪 on 2025/7/25.
//

import Foundation

enum Variety{
    case plus
    case minus
}

class GameRule:ObservableObject{
    static let shared=GameRule()
    var num:Int = 0
    var patternString:String = ""
//    init(){
//        self.num =  generateRandomNumber()
//        print(num)
//        self.patternString = choosePattern(id: getPattern(n: num))
//    }
    var randomNum=SystemRandomNumberGenerator()
    func successfulMatch(card1:Variety,card2:Variety)->Bool{
        if card1==card2{
            return true
        }else{
            return false
        }
    }
    
    func choosePattern(id:Variety)->String{
        if id == .plus{
            return "plus"
        }else{
            return "minus"
        }
    }
    
    func generateRandomNumber()->Int{
        var num=Int.random(in:  0...9 , using: &randomNum)
        return num
    }
    
    func getPattern(n:Int)->Variety{
        if(n<=6){
            return .plus
        }else{
            return .minus
        }
    }
}

struct Card{
    var identity:Variety
}
