//
//  main.swift
//  NBC_3W_NumBall
//
//  Created by 황석현 on 11/4/24.
//
import Foundation

// 게임 인스턴스 생성
let game = BaseballGame()

var userChoice = ""

print(SystemMessage.welcome)
userChoice = readLine()!

switch userChoice {
case "1":
    game.start()
case "2":
    game.printGameLog()
default:
    print(SystemMessage.wrongInput)
    exit(0)
}
