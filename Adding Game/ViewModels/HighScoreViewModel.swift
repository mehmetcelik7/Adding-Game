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
        
        //TODO: Perpahs fetch data is ascending(descending order
        func fetchHighScores(){
            
            let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
            
            do {
                highScores = try container.viewContext.fetch(request)

            }catch let error {
                print("Error fetching high socres: \(error.localizedDescription)")
            }
            
            
        }
        
    }
    
}
