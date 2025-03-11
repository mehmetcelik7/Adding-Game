//
//  ProblemModel.swift
//  Adding Game
//
//  Created by mehmet Çelik on 10.03.2025.
//


import Foundation

struct ProblemModel: Identifiable {
    let id = UUID()
    let number1: Int
    let number2: Int
    let level: Int
    
    // solutions[0] is the answer
    // the other elements are distractions.
    let solutions: [Int]
    
    var answer: Int {
        solutions[0]
    }
    
    func checkSolution( value: Int) -> Bool {
        !solutions.isEmpty && value == answer
    }
    
    init( level: Int) {
        self.level = level
        let lower = level * 5
        let upper = (level + 1) * 5
        self.number1 = Int.random(in: lower...upper)
        self.number2 = Int.random(in: lower...upper)
        let answer = number1 + number2
        
        var newSolution: [Int] = []
        newSolution.append( answer) // True solution at solution[0] = 27
        newSolution.append( answer + 10)  // solution[1] Distraction 37
        let belowAnswer = answer - 5
        let aboveAnswer = answer + 5
        newSolution.append(Int.random(in: answer+1...aboveAnswer))    // solution[2]
        newSolution.append(Int.random(in: belowAnswer..<answer))    // solution[3]
        self.solutions = newSolution
    }
}
