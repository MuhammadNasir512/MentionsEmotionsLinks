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
}
