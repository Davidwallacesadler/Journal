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
    
    // TODO: - Notify user to pass in a title - "Please enter a journal title, it is required" -- Or figure out how to make it optional.
    
    // TODO: - Enable Dismiss on tapping anywhere outside the popUpView.
    
    // TODO: - Fix JournalTableView not updating after saveButtonPressed.
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let title = journalTitleTextField.text else { return }
        JournalController.shared.addJournalwith(title: title)
        self.navigationController?.popViewController(animated: true)
    }
    
    // Mark: - Delegate Methods
    
    // TODO: - Fix return issue - keyboard does not dismiss when return is tapped.
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
