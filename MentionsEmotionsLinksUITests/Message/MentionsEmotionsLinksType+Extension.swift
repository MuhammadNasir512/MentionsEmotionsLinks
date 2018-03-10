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
    
    func thenInputTextViewMustBeAvaiable() {
        XCTAssertTrue(MentionsEmotionsLinksUIElements.inputTextFieldAccessibilityId.exists)
    }
    
    func thenOutputTextViewMustBeAvaiable() {
        XCTAssertTrue(MentionsEmotionsLinksUIElements.outputTextFieldAccessibilityId.exists)
    }
}
