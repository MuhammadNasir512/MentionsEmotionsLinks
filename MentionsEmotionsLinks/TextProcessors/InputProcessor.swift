//
//  InputProcessor.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import Foundation

class InputProcessor: NSObject, InputProcessorType {
    var text = ""
    
    required init(withText newText: String) {
        text = newText
        super.init()
    }
    
    func processData() -> [Any] {
        return ["InputProcessor"]
    }
}
