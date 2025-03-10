//
//  HighScoreViewModel.swift
//  Adding Game
//
//  Created by mehmet Çelik on 9.03.2025.
//

import Foundation
import CoreData


class HighScoreViewModel : ObservableObject {
    
    let container: NSPersistentContainer
    
    @Published var highScores: [HighScoreEntity] = []
    
    let MAX_NUM_HIGHSCORES = 100
    var minHighScore: Int64? {
        if highScores.isEmpty {
            return nil
        }else{
            return highScores.last?.score
        }
    }
    
    init() {
        container = NSPersistentContainer(name: "HighScoreDataModel")
        
        container
            .loadPersistentStores{ description, error in
            
                if let error {
                    print("Loading error: \(error.localizedDescription)")
                }else{
                    print("Loading succesful")
                }
                
            }
      
    }
    
    func isNewHighScore(score: Int) -> Bool {
        if score <= 0 {
            return false
        }else if let minHighScore {
            return minHighScore < score || highScores.count <= MAX_NUM_HIGHSCORES
        }else{
            return true
        }
    }
    
    func fetchHighScores(){
        
        let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
        let sortDescriptor = NSSortDescriptor(keyPath: \HighScoreEntity.score, ascending: false)
        
        request
            .sortDescriptors = [sortDescriptor]
        
        do {
            highScores = try container.viewContext.fetch(request)

        }catch let error {
            print("Error fetching high scores: \(error.localizedDescription)")
        }
        
    }
    func saveHighScore() {
        do {
           try container
                .viewContext
                .save()
            fetchHighScores()
        }catch let error {
            print("Error saving high scores: \(error.localizedDescription)")
        }
    }
    
    func addHighScore(name: String, score: Int64){
        let entity = HighScoreEntity(context: container.viewContext)
        entity.name = name
        entity.score = score
        saveHighScore()
        
    }
    func updateHighScore(entity: HighScoreEntity ,name: String){
        entity.name = name
       
        saveHighScore()
    }
    
    func deleteHighScore(entity: HighScoreEntity){
        
        container.viewContext.delete(entity)
       
        saveHighScore()
    }
    

        
}
