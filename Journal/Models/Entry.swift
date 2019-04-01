//
//  Entry.swift
//  Journal
//
//  Created by David Sadler on 3/31/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation
class Entry: Equatable {
    static func == (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.timeStamp == rhs.timeStamp && lhs.title == rhs.title && lhs.text == rhs.text
    }
    let timeStamp: Date = Date.init()
    let title: String
    let text: String
    init(title: String, text: String) {
        self.title = title
        self.text = text
    }
}
