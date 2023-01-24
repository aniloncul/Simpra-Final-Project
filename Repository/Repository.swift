//
//  Repository.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 23.01.2023.
//

import Foundation

protocol Repository {
    func create(gameId: Int) -> Bool
    func getAll() -> [String]?
    func delete(id: Int) -> Bool
    func checkExistsGameId(byId id: Int) -> Bool
}
