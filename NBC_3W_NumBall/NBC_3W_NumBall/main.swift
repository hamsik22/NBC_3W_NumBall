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

print("""
환영합니다! 원하시는 번호를 입력해주세요
1. 게임시작하기  2. 게임 기록 보기  3. 종료하기
""")
userChoice = readLine()!

switch userChoice {
case "1":
    game.start()
default:
    print("잘못된 입력입니다.")
    exit(0)
}
