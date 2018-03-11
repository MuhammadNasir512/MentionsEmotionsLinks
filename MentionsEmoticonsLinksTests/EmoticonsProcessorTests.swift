//
//  EmoticonsProcessorTests.swift
//  MentionsEmoticonsLinksTests
//
//  Created by Muhammad Nasir on 11/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest
@testable import MentionsEmoticonsLinks

class EmoticonsProcessorTests: XCTestCase {
    
    func testWhenEmptyStringProvided_thenItReturnsEmptyArray() {
        let processor = EmoticonsProcessor(withText: "")
        let resultUnderTest = processor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 0)
    }
    
    func testWhenStringWithoutEmoticonsIsProvided_thenItReturnsEmptyArray() {
        let processor = EmoticonsProcessor(withText: "test String www.google.com @mo")
        let resultUnderTest = processor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 0)
    }
    
    func testWhenStringWithEmoticonsIsProvided_thenItReturnsNonEmptyArray() {
        let processor = EmoticonsProcessor(withText: "@chris you around? (arya)")
        var resultUnderTest = processor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 1)
        XCTAssertTrue(resultUnderTest[0] == "arya")
        
        processor.text = "@chris (allthethings) you around? (areyoukiddingme), @bob, (zoidberg)"
        resultUnderTest = processor.processData()
        XCTAssertTrue(resultUnderTest.count == 3)
        XCTAssertTrue(resultUnderTest.contains("allthethings"))
        XCTAssertTrue(resultUnderTest.contains("areyoukiddingme"))
        XCTAssertTrue(resultUnderTest.contains("zoidberg"))
    }

}
