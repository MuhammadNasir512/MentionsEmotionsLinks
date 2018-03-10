//
//  MentionsProcessorTests.swift
//  MentionsEmotionsLinksTests
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest
@testable import MentionsEmotionsLinks

class MentionsProcessorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testWhenEmptyStringProvided_thenItReturnsEmptyArray() {
        let mentionsProcessor = MentionsProcessor(withText: "")
        let resultUnderTest = mentionsProcessor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 0)
    }
    
    func testWhenStringWithoutMentionsIsProvided_thenItReturnsEmptyArray() {
        let mentionsProcessor = MentionsProcessor(withText: "test String www.google.com (aww)")
        let resultUnderTest = mentionsProcessor.processData()
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 0)
    }
    
    func testWhenStringWithMentionsIsProvided_thenItReturnsNonEmptyArray() {
        let mentionsProcessor = MentionsProcessor(withText: "@chris you around?")
        var resultUnderTest = mentionsProcessor.processData() as! [String]
        XCTAssertNotNil(resultUnderTest)
        XCTAssertTrue(resultUnderTest.count == 1)
        XCTAssertTrue(resultUnderTest[0] == "chris")
        
        mentionsProcessor.text = "@chris you around? and how are @mike, @bob, @kate, @sam are doing"
        resultUnderTest = mentionsProcessor.processData() as! [String]
        XCTAssertTrue(resultUnderTest.count == 5)
        XCTAssertTrue(resultUnderTest.contains("chris"))
        XCTAssertTrue(resultUnderTest.contains("mike"))
        XCTAssertTrue(resultUnderTest.contains("kate"))
        XCTAssertTrue(resultUnderTest.contains("bob"))
        XCTAssertTrue(resultUnderTest.contains("sam"))
    }

}
