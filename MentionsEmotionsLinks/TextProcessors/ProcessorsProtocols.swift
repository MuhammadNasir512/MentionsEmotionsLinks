//
//  ProcessorsProtocols.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

protocol InputProcessorType {
}

protocol TextProcessorType: InputProcessorType {
    init(withText newText: String)
}

protocol MentionsProcessorType: TextProcessorType {
    func processData() -> [Any]
}
protocol EmotionsProcessorType: TextProcessorType {
    func processData() -> [Any]
}

protocol LinksProcessorType: TextProcessorType {
    func processData(_ completion: @escaping ([Any]) -> (Void))
}

