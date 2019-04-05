//
//  Entry.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation

class Entry: Equatable, Codable {
    
    // MARK: - Protocol Stub:
    
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.timeStamp == rhs.timeStamp &&
               lhs.title == rhs.title &&
               lhs.text == rhs.text
    }
    
    // MARK: - Internal Properties
    
    var timeStamp: Date = Date.init()
    var title: String
    var text: String
    
    // MARK: - Initializer:
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}
