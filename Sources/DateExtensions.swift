//
//  DateExtensions.swift
//  CircleCI-iOS
//
//  Created by Kevin Morton on 11/2/19.
//  Copyright © 2019 Circle-CI-Playground. All rights reserved.
//

import Foundation

// MARK: -

public extension Date {

    /// Current calendar.  NOTE: calendar is based on the users system (e.g. Calendar.current.identifier)..
    var calendar: Calendar {
        return Calendar(identifier: Calendar.current.identifier)
    }

    /// Numerical day of the week.
    var weekday: Int {
        return calendar.component(.weekday, from: self)
    }

    /// Whether the date is today.
    var isInToday: Bool {
        return calendar.isDateInToday(self)
    }

    /// Whether the date is tomorrow.
    var isInTomorrow: Bool {
        return calendar.isDateInTomorrow(self)
    }

    /// Whether the date is in the weekend.
    var isInWeekend: Bool {
        return calendar.isDateInWeekend(self)
    }

    /// Whether the date is during the week.
    var isWorkday: Bool {
        return !calendar.isDateInWeekend(self)
    }
}
