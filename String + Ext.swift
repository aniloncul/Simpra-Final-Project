//
//  String + Ext.swift
//  Simpra-Final-Project
//
//  Created by Anıl Öncül on 24.01.2023.
//

import Foundation

extension String {
  var withoutSpecials: String {
      let pattern = "[^A-Za-z0-9\" \"]+"
      let queryForDotlessI = self.replacingOccurrences(of: "ı", with: "i")
      let nonDiacritic = queryForDotlessI.folding(options: .diacriticInsensitive, locale: .current)
      let result = nonDiacritic.replacingOccurrences(of: pattern, with: "", options: [.regularExpression])
      return result
  }
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localization", bundle: .main, value: self, comment: self)
    }
    
    static func localizedWithParameter(string: String, parameter: String) -> String {
        return String.localizedStringWithFormat(NSLocalizedString(string, tableName: "Localization", bundle: .main, value: string, comment: ""), parameter)
    }
}
