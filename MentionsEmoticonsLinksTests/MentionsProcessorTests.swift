//
//  MentionsProcessorTests.swift
//  MentionsEmoticonsLinksTests
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest
@testable import MentionsEmoticonsLinks

class MentionsProcessorTests: XCTestCase {
    
    func testWhenEmptyStringProvided_thenItReturnsEmptyArray() {
        let processor = MentionsProcessor(withText: "")
        let resultUnderTest = processor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 0)
    }
    
    func testWhenStringWithoutMentionsIsProvided_thenItReturnsEmptyArray() {
        let processor = MentionsProcessor(withText: "test String www.google.com (aww)")
        let resultUnderTest = processor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 0)
    }
    
    func testWhenStringWithMentionsIsProvided_thenItReturnsNonEmptyArray() {
        let processor = MentionsProcessor(withText: "@chris you around?")
        var resultUnderTest = processor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 1)
        XCTAssertTrue(resultUnderTest[0] == "chris")
        
        processor.text = "@chris you around? and how are @mike, @bob, @kate, @sam are doing"
        resultUnderTest = processor.processData()
        XCTAssertTrue(resultUnderTest.count == 5)
        XCTAssertTrue(resultUnderTest.contains("chris"))
        XCTAssertTrue(resultUnderTest.contains("mike"))
        XCTAssertTrue(resultUnderTest.contains("kate"))
        XCTAssertTrue(resultUnderTest.contains("bob"))
        XCTAssertTrue(resultUnderTest.contains("sam"))
    }

}
