//
//  MentionsEmotionsLinksUIElements.swift
//  MentionsEmotionsLinksUITests
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest

enum MentionsEmotionsLinksUIElements {
    static let inputTextField = XCUIApplication().textViews["input_text_field"]
    static let outputTextField = XCUIApplication().textViews["output_text_field"]
    static let keyboardReturnButton = XCUIApplication().keyboards.buttons["return"]
}
