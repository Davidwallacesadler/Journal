//
//  DateFormatHelper.swift
//  Journal
//
//  Created by David Sadler on 4/1/19.
//  Copyright © 2019 David Sadler. All rights reserved.
//

import Foundation

class DateFormatHelper {
    
    static func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
