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
    var Entries: [Entry] = []
    // MARK: - CRUD
    func addEntryWith(title: String, text: String) {
        let newEntry = Entry.init(title: title, text: text)
        Entries.append(newEntry)
    }
    func remove(entry: Entry) {
        var i = 0
        for element in Entries {
            if element == entry {
                Entries.remove(at: i)
                break
            }
            i += 1
        }
    }
}
