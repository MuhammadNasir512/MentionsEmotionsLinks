//
//  ViewController+ProcessUserInput.swift
//  MentionsEmoticonsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit

extension ViewController {
    
    func processInput(_ text: String) {
        processLinks(text) { (linksArray) -> (Void) in
            let mentions = self.processMentions(text)
            let emoticons = self.processEmoticons(text)
            let links = linksArray as? [(String, String)] ?? [("", "")]
            let jsonFormattedString = self.jsonUtility.JsonFormattedString(withMentions: mentions, withEmoticons: emoticons, withLinks: links)
            self.updateOutputTextView(withJsonFormattedText: jsonFormattedString, originalText: text)
        }
    }
    
    private func processMentions(_ text: String) -> [String] {
        let processor = MentionsProcessor(withText: text)
        return processor.processData()
    }
    
    private func processEmoticons(_ text: String) -> [String] {
        let processor = EmoticonsProcessor(withText: text)
        return processor.processData()
    }
    
    private func processLinks(_ text: String, completion: @escaping (([Any]) -> (Void))) {
        let linksProcessor = LinksProcessor(withText: text)
        linksProcessor.processData { (dataArray) -> (Void) in
            completion(dataArray)
        }
    }
}

