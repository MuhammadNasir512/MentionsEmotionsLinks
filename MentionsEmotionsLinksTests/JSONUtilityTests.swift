//
//  JSONUtilityTests.swift
//  MentionsEmotionsLinksTests
//
//  Created by Muhammad Nasir on 11/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import MentionsEmotionsLinks

class JSONUtilityTests: XCTestCase {
    
    func testWhenEmptyDataIsProvidedThenItCreatesAValidString() {
        
        let testMentions = stubMentions(0)
        let testLinks = stubLinks(0)
        let jsonUtility = JSONUtility()
        
        let expectedValue = ""
        let valueUnderTest = jsonUtility.JsonFormattedString(withMentions: testMentions, withLinks: testLinks)
        
        XCTAssertTrue(valueUnderTest.count == 0)
        XCTAssertTrue(valueUnderTest == expectedValue)
    }
    
    func testWhenNonEmptyDataIsProvidedThenItCreatesAValidString() {
        
        let testMentions = stubMentions(3)
        let testLinks = stubLinks(3)
        let jsonUtility = JSONUtility()
        
        let expectedValue = "{\n  \"mentions\" : [\n    \"Item_1\",\n    \"Item_2\",\n    \"Item_3\"\n  ],\n  \"links\" : [\n    {\n      \"url\" : \"UrlValue_1\",\n      \"title\" : \"TitleValue_1\"\n    },\n    {\n      \"url\" : \"UrlValue_2\",\n      \"title\" : \"TitleValue_2\"\n    },\n    {\n      \"url\" : \"UrlValue_3\",\n      \"title\" : \"TitleValue_3\"\n    }\n  ]\n}"
        let valueUnderTest = jsonUtility.JsonFormattedString(withMentions: testMentions, withLinks: testLinks)
        
        XCTAssertTrue(valueUnderTest.count > 0)
        XCTAssertTrue(valueUnderTest == expectedValue)
        
        let json = JSON.init(parseJSON: valueUnderTest)
        
        let mentions = json["mentions"].arrayValue
        XCTAssertTrue(mentions.count == 3)
        
        let mentionOne = mentions[0].stringValue
        XCTAssertTrue(mentionOne == "Item_1")

        let links = json["links"].arrayValue
        XCTAssertTrue(links.count == 3)
        
        let linkOne = links[0].dictionaryValue
        XCTAssertTrue(linkOne["url"] == "UrlValue_1")
        XCTAssertTrue(linkOne["title"] == "TitleValue_1")
    }
    
    private func stubMentions(_ count: Int) -> [String] {
        var array = [String]()
        for index in 0..<count {
            array.append("Item_\(index+1)")
        }
        return array
    }
    
    private func stubLinks(_ count: Int) -> [(String, String)] {
        var array = [(String, String)]()
        for index in 0..<count {
            let item = ("UrlValue_\(index+1)", "TitleValue_\(index+1)")
            array.append(item)
        }
        return array
    }
}
