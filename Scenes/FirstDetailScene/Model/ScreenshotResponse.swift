//
//  GamesDetailResponse.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 21.01.2023.
//

import Foundation

struct ScreenshotResponse: Decodable {
    let results: [Screenshot]?
}

struct Screenshot: Decodable {
    let image: String?
    
}
