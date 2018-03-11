//
//  ViewController.swift
//  MentionsEmoticonsLinks
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
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    var jsonUtility = JSONUtility()
    var originalBottomConstant: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideActivityIndicator()
        setupTextView()
        setupActivityIndicatorView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        showActivityIndicator()
        processInput(text)
    }
    
    func updateOutputTextView(withJsonFormattedText jsonFormattedText: String, originalText: String) {
        
        hideActivityIndicator()

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

extension ViewController {
    
    func setupActivityIndicatorView() {
        guard let superView = activityIndicatorView.superview else { return }
        superView.layer.cornerRadius = superView.bounds.size.height / 2.0
        activityIndicatorView.activityIndicatorViewStyle = .whiteLarge
    }
    
    func showActivityIndicator() {
        guard let superView = activityIndicatorView.superview else { return }
        superView.superview?.isUserInteractionEnabled = false
        superView.isHidden = false
        activityIndicatorView.startAnimating()
    }
    
    func hideActivityIndicator() {
        guard let superView = activityIndicatorView.superview else { return }
        superView.superview?.isUserInteractionEnabled = true
        superView.isHidden = true
        activityIndicatorView.stopAnimating()
    }
}
