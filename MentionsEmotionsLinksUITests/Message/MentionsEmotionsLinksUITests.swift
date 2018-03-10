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
    
    func testMainViewHasInputTextView() {
        whenTheAppIsLaunched()
        // Then
        inputTextViewMustBeAvaiable()
    }
    
    func testMainViewHasOutputTextView() {
        whenTheAppIsLaunched()
        // Then
        outputTextViewMustBeAvaiable()
    }
    
    func testKeyboardShowsAndHidesWithUserInteractions() {
        whenTheAppIsLaunched()
        // Then
        inputTextViewMustBeAvaiable()
        
        // And When
        inputTextViewIsTapped()
        // Then
        keyboardShowsUpToInputText()
        // And
        returnKeyOnKeyboardMustExist()
        
        // And When
        returnKeyTappedFromKeyboard()
        // Then
        keyboardMustGoAway()
    }
}
