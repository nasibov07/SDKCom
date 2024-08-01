//
//  extension+String.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import Foundation

extension String {
    /// Gets a character from the string for the given position,
    /// or returns nil if the given position is out of range...
    func getCharacter(position: Int) -> Character? {
        guard self.count > position else { return nil }
        let index = self.index(self.startIndex, offsetBy: position)
        return self[index]
    }

    /// Formats the string using the given pattern
    func format(pattern: String, patternSpecialCharacter: Character = "#") -> String {
        var result = ""
        var stringOffset = 0
        var patternOffset = 0
        var stringCharacter: Character?
        var patternCharacter: Character?

        while self.count > stringOffset && pattern.count > patternOffset {
            patternCharacter = pattern.getCharacter(position: patternOffset)
            if patternCharacter != patternSpecialCharacter {
                result.append(patternCharacter!)
            } else {
                stringCharacter = self.getCharacter(position: stringOffset)
                result.append(stringCharacter!)
                stringOffset += 1
            }

            patternOffset += 1
        }

        return result
    }

    /// Localizes the string using the given arguments
    func localize(_ arguments: String...) -> String {
        let localizedString = NSLocalizedString(self, comment: "")
        return String(format: localizedString, arguments: arguments)
    }
    
    /// Переоброзовать номер телефона
    mutating func convertPhone(){
        //self = self.replacingOccurrences(of: "+", with: "", options: NSString.CompareOptions.literal, range: nil)
        self = self.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.literal, range: nil)
        self = self.replacingOccurrences(of: "(", with: "", options: NSString.CompareOptions.literal, range: nil)
        self = self.replacingOccurrences(of: ")", with: "", options: NSString.CompareOptions.literal, range: nil)
        self = self.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
}
