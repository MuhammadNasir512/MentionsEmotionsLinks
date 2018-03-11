//
//  ViewController.swift
//  MentionsEmotionsLinks
//
//  Created by Muhammad Nasir on 09/03/2018.
//  Copyright © 2018 Muhammad Nasir. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
    }
    deinit {
        webView.removeObserver(self, forKeyPath: "title")
    }

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
    
    func updateOutputTextView(withJsonFormattedText jsonFormattedText: String, originalText: String) {
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
        print("JSONString:\n\(string)\(jsonFormattedText)")
    }
}
