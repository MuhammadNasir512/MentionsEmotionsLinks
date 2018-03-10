//
//  MentionsProcessor.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

class MentionsProcessor: InputProcessor, MentionsProcessorType {
    
    private let regex = "^@([A-Za-z0-9_]+)|\\s([@#][\\w_-]+)"
    
    override func processData() -> [Any] {
        let mentions = findMentions(withRegex: regex, in: text)
        let formattedMentions = removeAtSignFrom(mentions)
        return formattedMentions
    }
    
    private func removeAtSignFrom(_ items: [String]) -> [String] {
        let trimmed = items.map {
            $0.trimmingCharacters(in: .whitespaces).replacingOccurrences(of: "@", with: "")
        }
        return trimmed
    }
    
    private func findMentions(withRegex regex: String, in text: String) -> [String] {
        
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
