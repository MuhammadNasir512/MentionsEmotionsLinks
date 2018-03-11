//
//  LinksProcessor+LinksExtraction.swift
//  MentionsEmoticonsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

extension LinksProcessor {
    
    func extractUrlStrings(from text: String) -> [String] {
        let linksTextCheckingResults = extractUrls(from: text)
        let linksArray = urlStrings(from: linksTextCheckingResults)
        return linksArray
    }
    
    private func urlStrings(from textCheckingResultArray: [NSTextCheckingResult]?) -> [String] {
        var array = [String]()
        guard let textCheckingResultArray = textCheckingResultArray else { return array }
        
        for textCheckingResult in textCheckingResultArray {
            if let url = textCheckingResult.url {
                array.append(url.absoluteString)
            }
        }
        return array
    }
    
    private func extractUrls(from string: String) -> [NSTextCheckingResult]? {
        let types: NSTextCheckingResult.CheckingType = .link
        do {
            let detector = try NSDataDetector(types: types.rawValue)
            let matches = detector.matches(
                in: string,
                options: .reportCompletion,
                range: NSMakeRange(0, string.count)
            )
            return matches
        } catch {
            print ("error in findAndOpenURL detector")
        }
        return nil
    }

}
