//
//  LinksProcessor.swift
//  MentionsEmoticonsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation
import SwiftLinkPreview

class LinksProcessor: InputProcessor, LinksProcessorType {
    
    private var linkStrings = [String]()
    private var linkTouples = [(String, String)]()
    var linkPreview = SwiftLinkPreview()
    
    func processData(_ completion: @escaping ([Any]) -> (Void)) {
        linkStrings = extractUrlStrings(from: text)
        loadNextLinkTitle(completion)
    }
    
    private func loadNextLinkTitle(_ completion: @escaping ([Any]) -> (Void)) {
        
        guard linkStrings.count > 0 else {
            completion(linkTouples)
            return
        }
        let linkString = linkStrings.remove(at: 0)
        
        linkPreview.previewLink(linkString, onSuccess: { (linksDictionary) in
            let linkTitle = linksDictionary[Constants.LinkPreviewResponseKeys.description] as? String ?? ""
            let linkTouple = (linkString, linkTitle)
            self.linkTouples.append(linkTouple)
            self.loadNextLinkTitle(completion)
        }) { (error: NSError) in
            print("Error")
        }
    }
}
