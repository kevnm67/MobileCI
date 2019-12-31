//
//  DateExtensions.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Foundation

// MARK: -

public extension Date {

    /// Current calendar.
    /// - NOTE: calendar is based on the users system (e.g. Calendar.current.identifier).
    var calendar: Calendar {
        Calendar(identifier: Calendar.current.identifier)
    }

    /// Numerical day of the week.
    var weekday: Int {
        calendar.component(.weekday, from: self)
    }

    /// Whether the date is today.
    var isInToday: Bool {
        calendar.isDateInToday(self)
    }

    /// Whether the date is tomorrow.
    var isInTomorrow: Bool {
        calendar.isDateInTomorrow(self)
    }

    /// Whether the date is in the weekend.
    var isInWeekend: Bool {
        calendar.isDateInWeekend(self)
    }

    /// Whether the date is during the week.
    var isWorkday: Bool {
        !calendar.isDateInWeekend(self)
    }
}
