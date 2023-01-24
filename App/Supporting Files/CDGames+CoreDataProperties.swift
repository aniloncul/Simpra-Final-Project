//
//  CDGames+CoreDataProperties.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 23.01.2023.
//

import Foundation
import CoreData

extension CDGames {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDGames> {
        return NSFetchRequest<CDGames>(entityName: "CDGames")
    }

    @NSManaged public var game_id: String?

}

extension CDGames : Identifiable {

}
