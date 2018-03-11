//
//  MentionsProcessor.swift
//  MentionsEmoticonsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

class MentionsProcessor: InputProcessor, MentionsProcessorType {
    
    private let regex = "^@([A-Za-z0-9_]+)|\\s([@#][\\w_-]+)"
    
    func processData() -> [String] {
        let mentions = String.findMatches(withRegex: regex, in: text)
        let formattedMentions = String.removeSubstring("@", from: mentions)
        return formattedMentions
    }
}
