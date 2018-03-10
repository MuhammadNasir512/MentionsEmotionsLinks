//
//  ViewController.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 09/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit

struct Constants {
    static let defaultTextForInputTextView = "Please enter text here."
}

class ViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint?
    @IBOutlet weak var heightConstraint: NSLayoutConstraint?
    @IBOutlet weak var textView: UITextView?
    var inputProcessorType: InputProcessorType?
    
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
    
    func userDidFinishEnteringText(_ text: String) {
        processInput(text)
    }
    
    private func processInput(_ text: String) {
        let mentions = processMentions(text)
        print("Mentions:\(mentions)")
    }
    
    private func processMentions(_ text: String) -> [String] {
        inputProcessorType = MentionsProcessor(withText: text) as MentionsProcessor
        guard let inputProcessorType = inputProcessorType else { return [] }
        return inputProcessorType.processText()
    }

    private func setupTextView() {
        guard let textView = textView else { return }
        textView.text = Constants.defaultTextForInputTextView

        guard
            let heightConstraint = heightConstraint,
            let bottomConstraint = bottomConstraint
            else { return }
        heightConstraint.constant = textView.intrinsicContentSize.height
        originalBottomConstant = bottomConstraint.constant
    }
}
