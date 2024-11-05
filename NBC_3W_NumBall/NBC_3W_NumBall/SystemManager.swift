//
//  SystemManager.swift
//  NBC_3W_NumBall
//
//  Created by 황석현 on 11/5/24.
//

import Foundation

/// 시스템 매니져의 이름을 가진만큼 프로그램 동작에 대한 관리를 한다.
class SystemManager {
    
    // 시스템 매니져의 책임에 맡게 싱글톤 패턴을 채택
    static let shared = SystemManager()
    private init() {}
    private var baseballGame = BaseballGame()
    
    
    func startProgram() {
        // 최초 안내 메세지
        printWelcomeMessage()
        while true {
            // 옵션을 선택하는 문구
            print(SystemMessage.optionList)
            // 옵션을 처리하는 함수
            processMenuSelection(selection: readLine()!)
        }
    }
    
    // 입력된 값을 처리하는 함수
    private func processMenuSelection(selection: String) {
        switch selection {
        case "1":
            startGame()
        case "2":
            showGameLog()
        case "3":
            exitProgram()
        default:
            print(SystemMessage.wrongInput)
        }
    }
    
    // 환영 문구를 출력하는 함수
    private func printWelcomeMessage() {
        print(SystemMessage.welcome)
    }
    
    // 게임을 시작하는 함수
    private func startGame() {
        baseballGame.start()
    }
    
    // 게임 기록을 보여주는 함수
    private func showGameLog() {
        baseballGame.printGameLog()
    }
    
    // 프로그램을 종료하는 함수
    private func exitProgram() {
        print(SystemMessage.exit)
        exit(0)
    }
    
}
