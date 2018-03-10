//
//  ViewController.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 09/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var textViewForInput: UITextView!
    @IBOutlet weak var textViewForOutput: UITextView!

    var inputProcessorType: InputProcessorType?
    var jsonUtility = JSONUtility()
    
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
        textViewForInput.text = Constants.defaultTextForInputTextView
        textViewForOutput.text = Constants.defaultTextForOutputTextView
        heightConstraint.constant = textViewForInput.intrinsicContentSize.height
        originalBottomConstant = bottomConstraint.constant
    }
    
    func userDidStartEnteringText() {
        textViewForOutput.text = Constants.defaultTextForOutputTextView
    }
    
    func userDidFinishEnteringText(_ text: String) {
        processInput(text)
    }
    
    private func processInput(_ text: String) {
        let mentions = processMentions(text)
        let jsonFormattedString = jsonUtility.JsonFormattedString(withArray: mentions)
        updateOutputTextView(withJsonFormattedText: jsonFormattedString, originalText: text)
    }
    
    private func processMentions(_ text: String) -> [String] {
        inputProcessorType = MentionsProcessor(withText: text) as MentionsProcessor
        guard
            let inputProcessorType = inputProcessorType,
            let mentionsArray = inputProcessorType.processData() as? [String]
            else { return [] }
        
        return mentionsArray
    }

    private func updateOutputTextView(withJsonFormattedText jsonFormattedText: String, originalText: String) {
        if (originalText.count == 0) {
            textViewForOutput.text = Constants.noInputTextMessageForOutputTextView
            return
        }

        let string = "\(Constants.inputValueHeadingForOutputTextView) \(originalText)\n\n"
        if (jsonFormattedText.count == 0) {
            textViewForOutput.text = "\(string)\(Constants.noSpecialStringForOutputTextView)"
            return
        }
        textViewForOutput.text = "\(string)\(jsonFormattedText)"
    }
}


