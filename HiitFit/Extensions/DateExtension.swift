//
//  DateExtension.swift
//  HiitFit
//
//  Created by Richie Flores on 10/31/23.
//

import Foundation

extension Date {
    
    /// Format a date using the specified format
    /// - parameters:
    ///     - format: A date pattern string like "MMM d"
    func formatted(as format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    /// Checks if another date is the same year, month, and day.
    /// - parameters:
    ///     - day:  The other date.
    ///
    func isSameDay(as day: Date) -> Bool {
        return self.yearMonthDay == day.yearMonthDay
    }
    
    // computed properties
    var yearMonthDay: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy MM dd"
        return dateFormatter.string(from: self)
    }
    var dayName: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
