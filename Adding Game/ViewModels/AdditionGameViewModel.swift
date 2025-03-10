//
//  AdditionGameViewModel.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//

import Foundation

class AdditionGameViewModel: ObservableObject {
    @Published var gameModel: GameModel = GameModel.defaultGame
    
    private var problemCount = 0
    let nextLevelBound = 5
    let maxIncreaseScore = 10
    
    var score: Int {
        gameModel.score
    }
    var timeToMoveUpNextLevel: Bool {
        problemCount % nextLevelBound == 0
    }
    var number1: Int {
        gameModel.currentProblem.number1
    }
    var number2: Int {
        gameModel.currentProblem.number2
    }
    var possibleSolutions: [Int] {
        gameModel.currentProblem.solutions.shuffled()
    }
    var answer: Int {
        gameModel.currentProblem.answer
    }
    var gameOver: Bool {
        gameModel.gameOver
    }
    
    func generateNumbers() {
        gameModel.currentProblem = ProblemModel(level: gameModel.level)
        
        problemCount += 1
        
        if timeToMoveUpNextLevel {
            gameModel.level += 1
        }
    }
    func increaseScore() {
        gameModel.score += min(gameModel.level,maxIncreaseScore)
    }
    
    func loseLife() {
        gameModel.lives = max(gameModel.lives - 1, 0)
        gameModel.score = max( gameModel.score - 2, 0)
    }
    
    func reset() {
        gameModel = GameModel.defaultGame
        problemCount = 0
    }
    
}
