//
//  BaseballGame.swift
//  NBC_3W_NumBall
//
//  Created by 황석현 on 11/4/24.
//

import Foundation

class BaseballGame {
    
    func start() {
        let answer = makeAnswer()
    }
    
    func makeAnswer() -> [Int] {
        var answer: [Int] = []
        
        // 난수생성 3회 반복
        for _ in 0..<4 {
            answer.append(Int.random(in: 1...6))
        }
        return answer
    }
}
