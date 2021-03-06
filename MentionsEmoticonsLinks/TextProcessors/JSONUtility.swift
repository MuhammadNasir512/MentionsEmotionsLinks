//
//  JSONUtility.swift
//  MentionsEmoticonsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONKeys {
    static let mentionsKey = "mentions"
    static let emoticonsKey = "emoticons"
    static let linksKey = "links"
    static let linksTitleKey = "title"
    static let linksUrlKey = "url"
}
class JSONUtility: NSObject {
    
    func JsonFormattedString(
        withMentions mentions: [String],
        withEmoticons emoticons: [String],
        withLinks links: [(String, String)]
        ) -> String {
        
        var outputDictionary = [String : Any]()
        
        if mentions.count > 0 {
            outputDictionary[JSONKeys.mentionsKey] = mentions
        }
        
        if emoticons.count > 0 {
            outputDictionary[JSONKeys.emoticonsKey] = emoticons
        }
        
        let linksJson = linksDictionaryArray(withLinks: links)
        if linksJson.count > 0 {
            outputDictionary[JSONKeys.linksKey] = linksJson
        }
        
        if (outputDictionary.count == 0) {
            return ""
        }
        
        let json = JSON(outputDictionary)
        let jsonString = json.rawString() ?? ""
        return escapeForwardSlashes(fromString: jsonString)
    }
    
    private func linksDictionaryArray(withLinks links: [(String, String)]) -> [[String: String]] {
        var linksArray = [[String: String]]()
        for oneLinkTouple in links {
            let linkDictionary = [
                JSONKeys.linksUrlKey: oneLinkTouple.0,
                JSONKeys.linksTitleKey: oneLinkTouple.1
            ]
            linksArray.append(linkDictionary)
        }
        return linksArray
    }
    
    private func escapeForwardSlashes(fromString string: String) -> String {
        return string.replacingOccurrences(of: "\\", with: "", options: NSString.CompareOptions.literal, range:nil)
    }
}
