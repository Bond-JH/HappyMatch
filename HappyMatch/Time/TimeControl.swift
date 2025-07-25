//
//  TimeControl.swift
//  HappyMatch
//
//  Created by 杨家豪 on 2025/7/24.
//

import Foundation

class TimeControl:ObservableObject{
    @Published var count:Int
    var timer:Timer?
    init(count: Int) {
        self.count = count
       
        
    }
    func record(){
        count-=1//实际上是self.count-=1的缩略版
    }
    func countDown(){
        timer?.invalidate()
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
            self.record()
            print(self.count)
        })
    }
    
    func stop(){
        timer?.invalidate()
    }
    
    func reset(n:Int){
        self.count=n
    }
    
    
    
//    //这里面的block相当于告诉计算机计时是为了什么
//    @Published var timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {_ in
//        
//    })
    
}
