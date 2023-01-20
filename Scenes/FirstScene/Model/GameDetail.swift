//
//  Games.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 18.01.2023.
//

import Foundation


struct GameDetail: Decodable {
    let id: Int
    let name: String
    let released: String?
    let backgroundImage: String?
    let backgroundImageAdditional: String?
    let rating: Double
    let description: String
    let genres: [Genre]
    
    struct Genre: Decodable {
        let name: String
    }
    
    
}
