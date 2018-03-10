//
//  ViewController.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 09/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit

struct Constants {
    static let defaultTextInputTextView = "Please enter text here."
}

class ViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint?
    @IBOutlet weak var heightConstraint: NSLayoutConstraint?
    @IBOutlet weak var textView: UITextView?
    
    var originalBottomConstant: CGFloat = 0

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupTextView()
        registerKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unregisterKeyboardNotifications()
        super.viewWillDisappear(animated)
    }
    
    private func setupTextView() {
        guard
            let heightConstraint = heightConstraint,
            let bottomConstraint = bottomConstraint,
            let textView = textView
            else { return }
        heightConstraint.constant = textView.intrinsicContentSize.height
        originalBottomConstant = bottomConstraint.constant
        textView.text = Constants.defaultTextInputTextView
    }
}
