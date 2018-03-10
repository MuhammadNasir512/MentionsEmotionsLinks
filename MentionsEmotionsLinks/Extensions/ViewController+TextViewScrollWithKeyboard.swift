//
//  ViewController+TextViewScrollWithKeyboard.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 10/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit

extension ViewController {
    
    @objc func keyboardWillShow(notification: NSNotification) {
        scrollTextView(appearing: true, notification: notification)
        textView?.text = ""
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollTextView(appearing: false, notification: notification)
        textView?.text = Constants.defaultTextInputTextView
    }
    
    func scrollTextView(appearing:Bool, notification:NSNotification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrameValue = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue,
            let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
            let bottomConstraint = bottomConstraint
            else {
                return
        }
        
        let padding: CGFloat = 10.0
        let keyboardFrame: CGRect = keyboardFrameValue.cgRectValue
        let changeInHeight = (appearing) ? (keyboardFrame.size.height+padding) : originalBottomConstant
        
        UIView.animate(withDuration: animationDurarion, animations: { () -> Void in
            bottomConstraint.constant = changeInHeight
        })
    }
}

