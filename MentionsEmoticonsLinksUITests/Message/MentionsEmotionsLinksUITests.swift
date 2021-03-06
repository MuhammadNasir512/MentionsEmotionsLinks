//
//  MentionsEmoticonsLinksUITests.swift
//  MentionsEmoticonsLinksUITests
//
//  Created by Muhammad Nasir on 09/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest

class MentionsEmoticonsLinksUITests: XCTestCase, MentionsEmoticonsLinksType {
    
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
    
    func testWhenUserHaveEnteredNothinThenProperMessageShowsInOutputTextView() {
        let textToInput = ""
        whenTheAppIsLaunched()
        // Then
        inputTextViewIsTapped()
        // And Then
        typeTextInInputTextView(textToInput)
        // And When
        returnKeyTappedFromKeyboard()
        // Then
        expectThatOutputFieldShowsInputNotProvided(textToInput)
    }
    
    func testWhenUserHaveEnteredPlainTextThenProperMessageShowsInOutputTextView() {
        let textToInput = "Text without any url, emoticon or mention"
        whenTheAppIsLaunched()
        // Then
        inputTextViewIsTapped()
        // And Then
        typeTextInInputTextView(textToInput)
        // And When
        returnKeyTappedFromKeyboard()
        // Then
        expectThatOutputFieldShowsNothingUsefulFound(textToInput)
    }
    
    func testWhenUserHaveEnteredAnyMentionsThenItShownInOutputTextView() {
        let textToInput = "@chris you around? and how are @mike, @bob, @kate, @sam are doing"
        whenTheAppIsLaunched()
        // Then
        inputTextViewIsTapped()
        // And Then
        typeTextInInputTextView(textToInput)
        // And When
        returnKeyTappedFromKeyboard()
        // Then
        expectThatOutputFieldShowsMentionsFound(textToInput)
    }
    
    func testWhenUserHaveEnteredAnyEmoticonsThenItShownInOutputTextView() {
        let textToInput = "chris (allthethings) you around? (areyoukiddingme), bob, (zoidberg)"
        whenTheAppIsLaunched()
        // Then
        inputTextViewIsTapped()
        // And Then
        typeTextInInputTextView(textToInput)
        // And When
        returnKeyTappedFromKeyboard()
        // Then
        expectThatOutputFieldShowsEmoticonsFound(textToInput)
    }
}
