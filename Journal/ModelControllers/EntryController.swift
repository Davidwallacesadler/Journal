//
//  EntryController.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: - Internal Properties
    
    var entries: [Entry] = []
    
    // MARK: - Initializer
    
    init() {
        loadFromPersistentStorage()
    }
    
    // MARK: - Shared Instance
    
    static let shared = EntryController()
    
    // MARK: - CRUD
    
    func addEntryWith(title: String, text: String) {
        let newEntry = Entry(title: title, text: text)
        entries.append(newEntry)
        saveToPersistentStorage()
    }
    
    func update(entry: Entry, newTitle: String, newText: String) {
        entry.title = newTitle
        entry.text = newText
        saveToPersistentStorage()
    }
    
    func remove(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence Methods
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "journal.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    func saveToPersistentStorage() {
        let encoder = JSONEncoder()
        do {
           let data = try encoder.encode(entries)
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
            let entries = try decoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch {
            print("There was an error when saving the file: \(error)")
            return
        }
    }
}
