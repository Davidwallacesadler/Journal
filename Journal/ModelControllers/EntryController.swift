//
//  EntryController.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: - Initializer
    
    init() {
        JournalController.shared.loadFromPersistentStorage()
    }
    
    // MARK: - Shared Instance
    
    static let shared = EntryController()
    
    // MARK: - CRUD
    
    func addEntryWith(journal: Journal, title: String, text: String) {
        let newEntry = Entry(title: title, text: text)
        journal.entryCollection.append(newEntry)
        JournalController.shared.saveToPersistentStorage()
    }
    
    func update(entry: Entry, newTitle: String, newText: String) {
        entry.title = newTitle
        entry.text = newText
        JournalController.shared.saveToPersistentStorage()
    }
    
    func remove(journal: Journal, entry: Entry) {
        guard let index = journal.entryCollection.index(of: entry) else { return }
        journal.entryCollection.remove(at: index)
        JournalController.shared.saveToPersistentStorage()
    }
}
