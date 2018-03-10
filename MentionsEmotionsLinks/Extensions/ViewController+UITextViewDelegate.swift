//
//  ViewController+UITextViewDelegate.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        guard let heightConstraint = heightConstraint else { return }
        heightConstraint.constant = textView.intrinsicContentSize.height
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if (text == "\n") {
            textView.resignFirstResponder()
            userDidFinishEnteringText(textView.text)
            textView.text = Constants.defaultTextForInputTextView
            return false
        }
        return true
    }
}

