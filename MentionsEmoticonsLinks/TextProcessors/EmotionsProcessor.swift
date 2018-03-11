//
//  EmoticonsProcessor.swift
//  MentionsEmoticonsLinks
//
//  Created by Muhammad Nasir on 11/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

class EmoticonsProcessor: InputProcessor, EmoticonsProcessorType {
    
    private let regex = "\\([A-Za-z0-9]+\\)"
    
    func processData() -> [String] {
        let emoticons = String.findMatches(withRegex: regex, in: text)
        var formattedMentions = String.removeSubstring("(", from: emoticons)
        formattedMentions = String.removeSubstring(")", from: formattedMentions)
        formattedMentions = formattedMentions.filter { Constants.emoticons.contains($0) }
        return formattedMentions
    }
}
