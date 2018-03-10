//
//  MentionsEmotionsLinksUITests.swift
//  MentionsEmotionsLinksUITests
//
//  Created by Muhammad Nasir on 09/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest

class MentionsEmotionsLinksUITests: XCTestCase, MentionsEmotionsLinksType {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMainViewHasInputTextView() {
        whenTheAppIsLaunched()
        thenInputTextViewMustBeAvaiable()
    }
    
    func testMainViewHasOutputTextView() {
        whenTheAppIsLaunched()
        thenOutputTextViewMustBeAvaiable()
    }
}
