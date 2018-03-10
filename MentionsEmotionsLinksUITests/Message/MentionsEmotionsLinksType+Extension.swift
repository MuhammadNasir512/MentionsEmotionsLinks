//
//  MentionsEmotionsLinksType+Extension.swift
//  MentionsEmotionsLinksUITests
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation
import XCTest

extension MentionsEmotionsLinksType {
    
    func whenTheAppIsLaunched() {
        XCUIApplication().launch()
    }
    
    func inputTextViewMustBeAvaiable() {
        XCTAssertTrue(MentionsEmotionsLinksUIElements.inputTextField.exists)
    }
    
    func outputTextViewMustBeAvaiable() {
        XCTAssertTrue(MentionsEmotionsLinksUIElements.outputTextField.exists)
    }
    
    func returnKeyOnKeyboardMustExist() {
        XCTAssertTrue(MentionsEmotionsLinksUIElements.keyboardReturnButton.exists)
    }

    func keyboardShowsUpToInputText() {
        XCTAssertTrue(XCUIApplication().keyboards.count > 0)
    }
    
    func keyboardMustGoAway() {
        XCTAssertTrue(XCUIApplication().keyboards.count == 0)
    }
    
    func inputTextViewIsTapped() {
        let element = MentionsEmotionsLinksUIElements.inputTextField
        element.tap()
    }
    
    func returnKeyTappedFromKeyboard() {
        let element = MentionsEmotionsLinksUIElements.keyboardReturnButton
        element.tap()
    }
    
    func typeTextInInputTextView(_ text: String) {
        let element = MentionsEmotionsLinksUIElements.inputTextField
        element.typeText(text)
    }
    
    func expectThatOutputFieldShowsInputNotProvided(_ originalText: String) {
        let expectedValue = "\(Constants.noInputTextMessageForOutputTextView)"
        
        let actualValue = MentionsEmotionsLinksUIElements.outputTextField.value as? String
        XCTAssert(actualValue == expectedValue)
    }
    
    func expectThatOutputFieldShowsNothingUsefulFound(_ originalText: String) {
        let expectedValue = "\(Constants.inputValueHeadingForOutputTextView) \(originalText)\n\n\(Constants.noSpecialStringForOutputTextView)"
        
        let actualValue = MentionsEmotionsLinksUIElements.outputTextField.value as? String
        XCTAssert(actualValue == expectedValue)
    }
    
    func expectThatOutputFieldShowsMentionsFound(_ originalText: String) {
        let expectedValue = "Input: @chris you around? and how are @mike, @bob, @kate, @sam are doing\n\n{\n  \"mentions\" : [\n    \"chris\",\n    \"mike\",\n    \"bob\",\n    \"kate\",\n    \"sam\"\n  ]\n}"
        
        let actualValue = MentionsEmotionsLinksUIElements.outputTextField.value as? String
        XCTAssert(actualValue == expectedValue)
    }
}
