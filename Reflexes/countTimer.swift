//
//  countTimer.swift
//  Reflexes
//
//  Created by 間口秀人 on 2022/08/28.
//

import Foundation

class startCounter: ObservableObject{
    var startValue: Double
    @Published var timerValue: Double
    @Published var reflexesValue: Double
    @Published var timerFlag: Bool
    @Published var timer: Timer
    
    init(){
        startValue = Double.random(in: 3...10)
        timerValue = 0.00
        reflexesValue = 0.00
        timer = Timer()
        timerFlag = true
        start()
    }
    
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){_ in
            //丸め誤差が出るので、お互い小数点第２位で切り捨てたものを比較
            if floor(self.timerValue*100)/100 == floor(self.startValue*100)/100{
                self.reflexesValue += 0.01
            }else{
                self.timerValue += 0.01
                print("計測開始は\(self.startValue)秒から")
                print(self.timerValue)
            }
        }
    }
    
}
