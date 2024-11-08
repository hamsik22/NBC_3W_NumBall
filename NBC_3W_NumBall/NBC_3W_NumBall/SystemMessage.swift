//
//  Contents.swift
//  NBC_3W_NumBall
//
//  Created by 황석현 on 11/4/24.
//

import Foundation

struct SystemMessage {
    
    static let welcome = "환영합니다! 원하시는 번호를 입력해주세요"
    static let optionList = "1. 게임시작하기  2. 게임 기록 보기  3. 종료하기\n"
    static let wrongInput = "올바르지 않은 입력값입니다.\n"
    static let gameStart = "< 게임을 시작합니다 >\n숫자를 입력하세요"
    static let correctAnswer = "정답입니다!"
    static let gameLog = "< 게임 기록 보기 >"
    static let exit = "< 숫자 야구 게임을 종료합니다 >"
    
    static func printWelcomeMessage() {
        print(SystemMessage.welcome)
    }
    
    static func printOptionList() {
        print(SystemMessage.optionList)
    }
    
    static func printCorrectAnswerMessage() {
        print(SystemMessage.correctAnswer)
    }
    
    static func printWrongInputMessage() {
        print(SystemMessage.wrongInput)
    }
    
    static func printExitMessage() {
        print(SystemMessage.exit)
    }
    
    static func printGameStartMessage() {
        print(SystemMessage.gameStart)
    }
    
    static func printStrikeMessage(score: Int) {
        print("\(score) 스트라이크")
    }
    
    static func printBallMessage(score: Int) {
        print("\(score) 볼")
    }
    
    static func printSTandBLMessage(strike: Int, ball: Int) {
        print("\(strike) 스트라이크 \(ball)볼")
    }
    
    static func printGameLog(logs: [(gameNumber: Int, answerCount: Int)]) {
        print(SystemMessage.gameLog)
        for log in logs {
            print("\(log.gameNumber)번째 게임 : 시도 횟수 - \(log.answerCount)회")
        }
        print("----------------------------")
    }
}
