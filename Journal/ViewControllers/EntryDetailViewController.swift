//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Internal Properties:
    var optionalEntry: Entry?
 
    // MARK: - Outlets:
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: - Actions:
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
        if optionalEntry == nil {
            EntryController.shared.addEntryWith(title: titleTextField.text ?? "empty", text: bodyTextView.text ?? "empty")
            } else {
            EntryController.shared.update(entry: optionalEntry!, newTitle: titleTextField.text ?? "empty", newText: bodyTextView.text ?? "empty")
        }
    }
    
    // MARK: - Delegate Methods:
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return resignFirstResponder()
    }
    
    // MARK: - Methods:
    func updateViews() {
        if optionalEntry?.title != nil && optionalEntry?.text != nil {
            titleTextField.text = optionalEntry?.text
            bodyTextView.text = optionalEntry?.title
        }
    }

    // MARK: - View Lifecycle:
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

}
