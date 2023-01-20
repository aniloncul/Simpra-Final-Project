//
//  Games.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 18.01.2023.
//

import Foundation

struct GamesResponse: Decodable {
    let results: [Game]?
    
    
}

struct Game: Decodable {
    let id: Int?
    let name: String?
    let background_image: String?
    let rating: Double?
    let released: String?
    
    
}

