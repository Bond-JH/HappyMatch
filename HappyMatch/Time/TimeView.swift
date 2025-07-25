//
//  TimeView.swift
//  HappyMatch
//
//  Created by 杨家豪 on 2025/7/24.
//
import SwiftUI
struct TimeView:View {
    @StateObject var time=TimeControl(count: 60)
    var start:some View{
        Button(action: {time.countDown()}, label: {
            Text("开始")
        })
    }
    var stop:some View{
        Button(action: {time.stop()}, label: {
            Text("停止")
        })
    }
    var reset:some View{
        Button(action: {time.reset(n: 60)}, label: {
            Text("复位")
        })
    }
    var body: some View {
        VStack{
            Text("\(time.count)")
            start
            stop
            reset
        }
    }
    
}

#Preview {
    TimeView()
}
