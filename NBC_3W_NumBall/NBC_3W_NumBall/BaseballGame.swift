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
    private var answerCount: Int = 0
    private var gameCount: Int = 0
    private var gameLog: [(Int, Int)] = []
    
    /// 게임을 시작하는 함수
    func start() {
        self.numBall = makeNumBall()
        print(numBall)
        play()
    }
    
    /// 게임 기록을 출력하는 함수
    func printGameLog() {
        SystemMessage.printGameLog(logs: self.gameLog)
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
            self.increaseCount()
        }
        // 정답을 맞추면 게임 기록을 저장해야한다.
        self.increaseGameCount()
        self.saveGameInfo()
        self.initGameInfo()
        print(SystemMessage.correctAnswer)
    }
    
    /// 입력값을 반환하는 함수
    func getAnswer() -> String {
        readLine()!
    }
    
    /// 응답횟수를 증가시키는 함수
    func increaseCount() {
        self.answerCount += 1
    }
    
    /// 게임횟수를 증가시키는 함수
    func increaseGameCount() {
        self.gameCount += 1
    }
    
    /// 게임횟수, 응답횟수를 저장하는 함수
    func saveGameInfo() {
        self.gameLog.append((self.gameCount, self.answerCount))
    }
    
    /// 이전 게임 정보를 초기화하는 함수
    func initGameInfo() {
        self.answerCount = 0
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
