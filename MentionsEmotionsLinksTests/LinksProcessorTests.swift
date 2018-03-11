//
//  LinksProcessorTests.swift
//  MentionsEmotionsLinksTests
//
//  Created by Muhammad Nasir on 11/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest
import SwiftLinkPreview
@testable import MentionsEmotionsLinks

class LinksProcessorTests: XCTestCase {
    
    func testWhenEmptyStringProvided_thenItReturnsEmptyArray() {
        doEmptyArrayTestWithInputString("")
    }

    func testWhenStringWithoutLinksIsProvided_thenItReturnsEmptyArray() {
        doEmptyArrayTestWithInputString("@mo, this is text withour url (aww)")
    }
    
    func testWhenStringWithLnksIsProvided_thenItReturnsNonEmptyArray() {
        
        let string = "How technology www.google.com is changing: http://t.ted.com/mzRtRfX hhh"
        let previewFake = SwiftLinkPreviewFake()
        previewFake.shouldReturnAnyResponseItem = true
        let processor = LinksProcessor(withText: string)
        processor.linkPreview = previewFake
        
        let expect = expectation(description: "linksProcessingExpectation")
        processor.processData { (linksArray) -> (Void) in
            
            guard let linksArray = linksArray as? [(String, String)] else {
                XCTFail()
                return
            }
            XCTAssertTrue(linksArray.count == 2)
            XCTAssertTrue(linksArray.count == previewFake.previewCallCount)
            XCTAssertTrue(linksArray[0].0.range(of: "www.google.com") != nil)
            XCTAssertTrue(linksArray[1].0.range(of: "http://t.ted.com/mzRtRfX") != nil)
            XCTAssertTrue(linksArray[0].1 == "FakeDescription")
            XCTAssertTrue(linksArray[1].1 == "FakeDescription")
            expect.fulfill()
        }
        waitForExpectations(timeout: 3) { (error) in
            if error != nil {
                XCTFail()
            }
        }
    }

    private func doEmptyArrayTestWithInputString(_ string: String) {
        let previewFake = SwiftLinkPreviewFake()
        let processor = LinksProcessor(withText: string)
        processor.linkPreview = previewFake

        let expect = expectation(description: "linksProcessingExpectation")
        processor.processData { (linksArray) -> (Void) in
            
            guard let linksArray = linksArray as? [(String, String)] else {
                XCTFail()
                return
            }
            XCTAssertTrue(linksArray.count == 0)
            expect.fulfill()
        }
        waitForExpectations(timeout: 3) { (error) in
            if error != nil {
                XCTFail()
            }
        }
    }
}


