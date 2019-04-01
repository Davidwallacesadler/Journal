//
//  EntryController.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation

class EntryController {
    
    // MARK: - Shared Instance
    static let shared = EntryController()
    var entries: [Entry] = []
    
    // MARK: - CRUD
    func addEntryWith(title: String, text: String) {
        let newEntry = Entry.init(title: title, text: text)
        entries.append(newEntry)
    }
    func update(entry: Entry, newTitle: String, newText: String) {
        entry.title = newTitle
        entry.text = newText
    }
    func remove(entry: Entry) {
        var i = 0
        for element in entries {
            if element == entry {
                entries.remove(at: i)
                break
            }
            i += 1
        }
    }
}
