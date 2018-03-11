//
//  ProcessorsProtocols.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

protocol TextProcessorType {
    func processData() -> [String]
}

protocol MentionsProcessorType: TextProcessorType {}
protocol EmotionsProcessorType: TextProcessorType {}

protocol LinksProcessorType {
    func processData(_ completion: @escaping ([Any]) -> (Void))
}

