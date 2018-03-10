//
//  ProcessorsProtocols.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

protocol InputProcessorType {
    func processText() -> [String]
}

protocol TextProcessorType: InputProcessorType {
    init(withText newText: String)
}

protocol MentionsProcessorType: TextProcessorType {}

