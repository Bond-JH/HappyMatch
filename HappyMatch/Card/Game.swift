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
    var choosenCards:[Card]=[]
    var scores=0
    var num:Int = 0
    var patternString:String = ""
//    init(){
//        self.num =  generateRandomNumber()
//        print(num)
//        self.patternString = choosePattern(id: getPattern(n: num))
//    }
    var randomNum=SystemRandomNumberGenerator()
    
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
    
    func choose(c:Card){
        if(choosenCards.count<=2){
            choosenCards.append(c)
        }
        
    }
    
    func cancel(c:Card ,status:Bool){
        if(status){
            choosenCards.removeLast()
        }
    }
    
//    func match(c1Status:Bool,c1:Card,c2Status:Bool,c2:Card){
//        if(c1Status){
//            choose(c: c1)
//        }
//        
//        if(c2Status){
//            choose(c: c2)
//        }
//    }
    
    func Score(){
        scores+=1
    }
    
    func succeed(){
        if(choosenCards.count==2){
            if(choosenCards[0].identity==choosenCards[1].identity){
                Score()
            }
        }
    }
  
    
}

struct Card{
    var identity:Variety
}
