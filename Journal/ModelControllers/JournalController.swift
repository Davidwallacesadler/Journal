//
//  JournalController.swift
//  Journal
//
//  Created by David Sadler on 4/2/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation

class JournalController {
    
    // MARK: - Internal Properties
    
    var journals: [Journal] = []
    
    // MARK: - Shared Instance
    
    static let shared = JournalController()
    
    // MARK: - CRUD
    
    func addJournalwith(title: String) {
        let newJournal = Journal(journalName: title, entryCollection: [])
        journals.append(newJournal)
    }
  
    func update(destinationJournal: Journal, newEntry: Entry) {
        destinationJournal.entryCollection.append(newEntry)
    }
    
    func remove(journal: Journal) {
        guard let index = journals.lastIndex(of: journal) else { return }
        journals.remove(at: index)
    }
    
    func removeEntry(journal: Journal, journalEntry: Entry) {
        guard let index = journal.entryCollection.index(of: journalEntry) else { return }
        journal.entryCollection.remove(at: index)
    }
    
    // MARK: - Persistence Methods?
    // TODO: - Put persistence methods in a file and call a static shared reference??
}
