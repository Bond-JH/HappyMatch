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
        if(choosenCards.count<2){
            choosenCards.append(c)
        }
    }
//    func cancel(c:Card ,status:Bool){
//        if(status){
//            choosenCards.removeLast()
//        }
//    }
    func Score(){
        scores+=1
    }
    
//    func judge(c:[Card])->Bool{
//        if c.count<2{
//            return true
//        }else{
//            return false
//        }
//    }
    func cancel(c: Card) {
            choosenCards.removeAll { $0.id == c.id }
        }
    func checkMatch() {
            guard choosenCards.count == 2 else { return }
            if choosenCards[0].identity == choosenCards[1].identity {
                scores += 1
                choosenCards.removeAll()
            }
        }
    
    
    func succeed(){
        if(choosenCards.count==2){
            if(choosenCards[0].identity==choosenCards[1].identity){
                Score()
                choosenCards.removeAll()
                
            }
        }
    }
}
struct Card{
    var identity:Variety
    let id: UUID
}
