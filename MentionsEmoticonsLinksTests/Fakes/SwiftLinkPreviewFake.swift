//
//  SwiftLinkPreviewFake.swift
//  MentionsEmoticonsLinksTests
//
//  Created by Muhammad Nasir on 11/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation
import SwiftLinkPreview
@testable import MentionsEmoticonsLinks

class SwiftLinkPreviewFake: SwiftLinkPreview {
    
    var previewCallCount = 0
    var shouldReturnAnyResponseItem = false
    var urlDescriptionToReturn = "FakeDescription"
    
    override func previewLink(_ text: String, onSuccess: @escaping (Dictionary<String, Any>) -> Void, onError: @escaping (NSError) -> Void) -> Cancellable {
        previewCallCount += 1
        if shouldReturnAnyResponseItem {
            onSuccess(fakeResponseLinkPreview())
        }
        else {
            onError(NSError())
        }
        return Cancellable()
    }
    
    private func fakeResponsePreview() -> Response {
        var response = Response()
        response[SwiftLinkResponseKey.description] = urlDescriptionToReturn as Any?
        return response
    }
    
    private func fakeResponseLinkPreview() -> Dictionary<String, Any> {
        var response = Dictionary<String, Any>()
        response[Constants.LinkPreviewResponseKeys.description] = urlDescriptionToReturn as Any?
        return response
    }
}
