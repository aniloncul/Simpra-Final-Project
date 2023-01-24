//
//  Date.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 24.01.2023.
//

import Foundation

extension Date {
    static func convertNowToShortFormat() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: now)
    }
}
