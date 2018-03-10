//
//  JSONUtility.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONKeys {
    static let mentionsKey = "mentions"
}
class JSONUtility: NSObject {
    
    func JsonFormattedString(withArray array: [String]) -> String {
        
        let jsonOutput: JSON = JSON([JSONKeys.mentionsKey: array])
        guard array.count > 0, let jsonString = jsonOutput.rawString() else { return "" }
        return jsonString
    }
    
    func appendMentions(_ mentions: [String], inJson existingJson: JSON) {
        
    }
    func appendJsonObject(_ newJson: JSON, inJson existingJson: JSON) {
        
    }
}
