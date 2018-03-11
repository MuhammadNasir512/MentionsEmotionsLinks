//
//  MentionsEmoticonsLinksType+Extension.swift
//  MentionsEmoticonsLinksUITests
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation
import XCTest

extension MentionsEmoticonsLinksType {
    
    func whenTheAppIsLaunched() {
        XCUIApplication().launch()
    }
    
    func inputTextViewMustBeAvaiable() {
        XCTAssertTrue(MentionsEmoticonsLinksUIElements.inputTextField.exists)
    }
    
    func outputTextViewMustBeAvaiable() {
        XCTAssertTrue(MentionsEmoticonsLinksUIElements.outputTextField.exists)
    }
    
    func returnKeyOnKeyboardMustExist() {
        XCTAssertTrue(MentionsEmoticonsLinksUIElements.keyboardReturnButton.exists)
    }

    func keyboardShowsUpToInputText() {
        XCTAssertTrue(XCUIApplication().keyboards.count > 0)
    }
    
    func keyboardMustGoAway() {
        XCTAssertTrue(XCUIApplication().keyboards.count == 0)
    }
    
    func inputTextViewIsTapped() {
        let element = MentionsEmoticonsLinksUIElements.inputTextField
        element.tap()
    }
    
    func returnKeyTappedFromKeyboard() {
        let element = MentionsEmoticonsLinksUIElements.keyboardReturnButton
        element.tap()
    }
    
    func typeTextInInputTextView(_ text: String) {
        let element = MentionsEmoticonsLinksUIElements.inputTextField
        element.typeText(text)
    }
    
    func expectThatOutputFieldShowsInputNotProvided(_ originalText: String) {
        let expectedValue = "\(Constants.noInputTextMessageForOutputTextView)"
        
        let actualValue = MentionsEmoticonsLinksUIElements.outputTextField.value as? String
        XCTAssert(actualValue == expectedValue)
    }
    
    func expectThatOutputFieldShowsNothingUsefulFound(_ originalText: String) {
        let expectedValue = "\(Constants.inputValueHeadingForOutputTextView) \(originalText)\n\n\(Constants.noSpecialStringForOutputTextView)"
        
        let actualValue = MentionsEmoticonsLinksUIElements.outputTextField.value as? String
        XCTAssert(actualValue == expectedValue)
    }
    
    func expectThatOutputFieldShowsMentionsFound(_ originalText: String) {
        let expectedValue = "Input: @chris you around? and how are @mike, @bob, @kate, @sam are doing\n\n{\n  \"mentions\" : [\n    \"chris\",\n    \"mike\",\n    \"bob\",\n    \"kate\",\n    \"sam\"\n  ]\n}"
        
        let actualValue = MentionsEmoticonsLinksUIElements.outputTextField.value as? String
        XCTAssert(actualValue == expectedValue)
    }
}
