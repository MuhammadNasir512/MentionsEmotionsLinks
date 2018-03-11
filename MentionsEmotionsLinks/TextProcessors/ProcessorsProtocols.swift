//
//  ProcessorsProtocols.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

protocol InputProcessorType {
    func processData() -> [Any]
}

protocol TextProcessorType: InputProcessorType {
    init(withText newText: String)
}

protocol MentionsProcessorType: TextProcessorType {}

protocol LinksProcessorType {
    init(withText newText: String)
    func processData(_ completion: @escaping ([Any]) -> (Void))
}

