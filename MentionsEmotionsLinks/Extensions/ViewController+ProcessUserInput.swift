//
//  ViewController+ProcessUserInput.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit

extension ViewController {
    
    func processInput(_ text: String) {
        processLinks(text) { (linksArray) -> (Void) in
            let mentions = self.processMentions(text)
            let links = linksArray as? [(String, String)] ?? [("", "")]
            let jsonFormattedString = self.jsonUtility.JsonFormattedString(withMentions: mentions, withLinks: links)
            self.updateOutputTextView(withJsonFormattedText: jsonFormattedString, originalText: text)
        }
    }
    
    private func processMentions(_ text: String) -> [String] {
        inputProcessorType = MentionsProcessor(withText: text) as MentionsProcessor
        guard
            let inputProcessorType = inputProcessorType,
            let mentionsArray = inputProcessorType.processData() as? [String]
            else { return [] }
        
        return mentionsArray
    }
    
    private func processLinks(_ text: String, completion: @escaping (([Any]) -> (Void))) {
        let linksProcessor = LinksProcessor(withText: text)
        linksProcessor.processData { (dataArray) -> (Void) in
            completion(dataArray)
        }
    }
}

