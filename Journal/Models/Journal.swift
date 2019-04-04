//
//  Journal.swift
//  Journal
//
//  Created by David Sadler on 4/2/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation

class Journal : Equatable {
    
    // MARK: Protocol methods
    
    static func == (lhs: Journal, rhs: Journal) -> Bool {
        return lhs.name == rhs.name &&
               lhs.entryCollection == rhs.entryCollection
    }
    
    // MARK: - Internal Properties
    
    var name: String
    var entryCollection: [Entry]
    
    // MARK: - Initialzier
    
    init(journalName: String, entryCollection: [Entry]) {
        self.name = journalName
        self.entryCollection = entryCollection
    }
}
