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
    
    // MARK: - Initializer
    
    init() {
        loadFromPersistentStorage()
    }
    
    // MARK: - Shared Instance
    
    static let shared = JournalController()
    
    // MARK: - CRUD
    
    func addJournalwith(title: String) {
        let newJournal = Journal(journalName: title, entryCollection: [])
        journals.append(newJournal)
        saveToPersistentStorage()
    }
  
    func update(destinationJournal: Journal, newEntry: Entry) {
        destinationJournal.entryCollection.append(newEntry)
        saveToPersistentStorage()
    }
    
    // TODO: - add func updatewith(journalToModify Journal, newtitle: String)
    
    func remove(journal: Journal) {
        guard let index = journals.lastIndex(of: journal) else { return }
        journals.remove(at: index)
        saveToPersistentStorage()
    }
    
    
    func removeEntry(journal: Journal, journalEntry: Entry) {
        guard let index = journal.entryCollection.index(of: journalEntry) else { return }
        journal.entryCollection.remove(at: index)
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence Methods
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "journals.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(journals)
            try data.write(to: fileURL())
        } catch {
            print("There was an error when saving the file: \(error)")
            return
        }
    }
    
    func loadFromPersistentStorage() {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let journals = try decoder.decode([Journal].self, from: data)
            self.journals = journals
        } catch {
            print("There was an error when saving the file: \(error)")
            return
        }
    }
}
