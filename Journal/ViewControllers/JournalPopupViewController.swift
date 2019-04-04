//
//  JournalPopupViewController.swift
//  Journal
//
//  Created by David Sadler on 4/2/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import UIKit

class JournalPopupViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var setJournalLabel: UILabel!
    @IBOutlet weak var journalTitleTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Actions
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = journalTitleTextField.text else { return }
        JournalController.shared.addJournalwith(title: title)
        dismiss(animated: true)
    }
    
    // Mark: - Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
