//
//  EntryDetailViewController.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - View Lifecycle:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        self.clearButton.layer.cornerRadius = 10
    }
    
    // TODOL: - Update nav bar title with entry title

    // MARK: Internal Properties:
    
    var entry: Entry?
    var journal: Journal?
 
    // MARK: - Outlets:
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var BodyTextLabel: UILabel!
    @IBOutlet weak var EntryTitleLabel: UILabel!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    // MARK: - Actions:
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextView.text = ""
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, let text = bodyTextView.text, let selectedJournal = journal else { return }
        if let entry = self.entry {
            EntryController.shared.update(entry: entry, newTitle: title, newText: text)
        } else {
            EntryController.shared.addEntryWith(journal: selectedJournal, title: title, text: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Delegate Methods:
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Methods:
    
    func updateViews() {
            titleTextField.text = entry?.title
            bodyTextView.text = entry?.text
            self.title = entry?.title
    }
}
