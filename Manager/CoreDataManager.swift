//
//  CoreDataManager.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 23.01.2023.
//


import CoreData
import UIKit

protocol CoreDataManagerProtocol {
    var notesDelegate: CoreDataManagerDelegate? { get set }
}

protocol CoreDataManagerDelegate: AnyObject {
    func coreDataUpdated()
}

final class CoreDataManager: CoreDataManagerProtocol {
    static let shared = CoreDataManager()
    weak var notesDelegate: CoreDataManagerDelegate?
    private let managedContext: NSManagedObjectContext!
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func saveToFavorites(game: Game, completion: () -> Void) {
        let entity = NSEntityDescription.entity(forEntityName: "FavoritesCoreData", in: managedContext)!
        let favoriteGameObject = NSManagedObject(entity: entity, insertInto: managedContext)
        favoriteGameObject.setValue(game.gameId, forKey: "gameId")
        favoriteGameObject.setValue(game.name, forKey: "gameName")
        favoriteGameObject.setValue(game.backgroundImage, forKey: "gameImage")
        favoriteGameObject.setValue(game.releaseFormattedDate, forKey: "gameReleased")
        favoriteGameObject.setValue(game.genreText, forKey: "genres")
        favoriteGameObject.setValue(game.metacriticString, forKey: "metacritic")
        favoriteGameObject.setValue(game.parentPlatformText, forKey: "platforms")
        favoriteGameObject.setValue(game.ratingString, forKey: "raiting")
        favoriteGameObject.setValue(game.suggestionCountString, forKey: "suggestions")
        favoriteGameObject.setValue(game.reviewsCountString, forKey: "reviews")
        do {
            try managedContext.save()
            completion()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func getGames(completion: () -> Void) -> [FavoritesCoreData]{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoritesCoreData")
        
        do {
            let notes = try managedContext.fetch(fetchRequest)
            completion()
            return notes as! [FavoritesCoreData]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    func removeFromFavorites(id: Int, completion: () -> Void) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoritesCoreData")
        fetchRequest.predicate = NSPredicate(format: "gameId == %i", id)
        guard let result = try? managedContext.fetch(fetchRequest).first else {
            completion()
            return
        }
        managedContext.delete(result)
        
        do {
            try managedContext.save()
            completion()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

    
    func isFavorited(game: Game) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoritesCoreData")
        let gameId = game.gameId
        fetchRequest.predicate = NSPredicate(format: "gameId == %i", gameId)
        guard let results = try? managedContext.fetch(fetchRequest) else { return false }
        if !results.isEmpty {
            return true
        } else {
            return false
        }
    }
}
    

