//
//  BaseballGame.swift
//  NBC_3W_NumBall
//
//  Created by 황석현 on 11/4/24.
//

import Foundation

class BaseballGame {
    
    private var numBall: [String] = [] // 정답 번호
    private var answer: String = "" // 입력 번호
    private var isAnswerCorrect: Bool = false
    private var strike: Int = 0
    private var ball: Int = 0
    
    /// 게임을 시작하는 함수
    func start() {
        self.numBall = makeNumBall()
        play()
    }
    
    /// 게임을 진행하는 함수
    func play() {
        print(SystemMessage.gameStart)
        while !isAnswerCorrect {
            self.answer = getAnswer()
            guard isCorrectAnswer(answer: answer) else {
                print(SystemMessage.wrongInput)
                continue
            }
            self.checkAnswer(answer: answer)
            self.printHint()
        }
        
        print(SystemMessage.correctAnswer)
    }
    
    /// 입력값을 반환하는 함수
    func getAnswer() -> String {
        readLine()!
    }
    
    /// 정답을 생성하는 함수
    func makeNumBall() -> [String] {
        var isValid = false
        var randomNum: Int = 0
        
        while !isValid {
            randomNum = Int.random(in: 100...999)
            // Set을 활용하여 Set의 크기가 3이면 반환한다.
            if Set(String(randomNum).map{ $0 }).count == 3 {
                isValid = true
                return String(randomNum).map{ String($0) }
            }
        }
    }
    
    /// 입력값이 올바른지 확인하는 함수(1~9가 입력되어야한다.)
    func isCorrectAnswer(answer: String) -> Bool {
        guard (answer.allSatisfy(\.isNumber)) && (answer.contains{"1"..."9" ~= $0 }) else { return false }
        return true
    }
    
    /// 정답을 비교하는 함수
    func checkAnswer(answer: String) {
        self.strike = 0
        self.ball = 0
        let answerArray = { answer.map{ String($0) } }()
        
        for i in 0..<3 {
            if numBall[i] == answerArray[i] {
                self.strike += 1
            } else if numBall.contains(answerArray[i]) {
                self.ball += 1
            }
            
            if numBall == answerArray {
                self.isAnswerCorrect = true
            }
        }
    }
    
    /// 힌트를 출력하는 함수
    func printHint() {
        if self.strike > 0 && self.ball > 0 {
            print(SystemMessage.printSTandBLMessage(strike: strike, ball: ball))
        } else if self.strike > 0 {
            print(SystemMessage.printStrikeMessage(score: strike))
        } else if self.ball > 0 {
            print(SystemMessage.printBallMessage(score: ball))
        }
    }
    
}
