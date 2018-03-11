//
//  String+Utilities.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 11/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

extension String {
    
    static func removeSubstring(_ substring: String, from items: [String]) -> [String] {
        let trimmed = items.map {
            $0.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: substring, with: "")
        }
        return trimmed
    }
    
    static func findMatches(withRegex regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }

}
