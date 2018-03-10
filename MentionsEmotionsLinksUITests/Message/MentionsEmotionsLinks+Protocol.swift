//
//  Message+Protocol.swift
//  MentionsEmotionsLinksUITests
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

protocol MentionsEmotionsLinksType {
    
    func testMainViewHasInputTextView()
    func testMainViewHasOutputTextView()
    func testKeyboardShowsAndHidesWithUserInteractions()
    func testWhenUserHaveEnteredNothinThenProperMessageShowsInOutputTextView()
    func testWhenUserHaveEnteredPlainTextThenProperMessageShowsInOutputTextView()
    func testWhenUserHaveEnteredAnyMentionsThenItShownInOutputTextView()
}

