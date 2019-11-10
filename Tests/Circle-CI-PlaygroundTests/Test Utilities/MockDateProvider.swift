//
//  MockDateProvider.swift
//  CircleCI-iOS
//
//  Created by Kevin Morton on 11/10/19.
//  Copyright © 2019 Circle-CI-Playground. All rights reserved.
//

import Foundation

struct DateWithTime {
    var dateString: String
    var hour: Int = 11
    var minute: Int = 11
    var sec: Int = 11
}

// MARK: -

struct DateTestProvider {

    enum DateFormat: String {

        /// GMT  +00:00.
        case gmt = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"

        /// Only the date (e.g. yyyy-MM-dd).
        case dateNoTime = "yyyy-MM-dd"
    }

    // MARK: -

    static func testDate(_ dateString: String = "2019-02-17") -> Date? {
        return testDate(DateWithTime(dateString: dateString))
    }

    static func testDate(_ dateTime: DateWithTime) -> Date? {
        let aDate = "\(dateTime.dateString)T\(dateTime.hour):\(dateTime.minute):\(dateTime.sec).047Z"

        return aDate.date(timeZoneIdentifier: nil)
    }
}

// MARK: -

extension String {

    func date(_ format: DateTestProvider.DateFormat = .gmt, timeZoneIdentifier: String? = nil) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue

        if let timeZone = timeZoneIdentifier {
            formatter.timeZone = TimeZone(identifier: timeZone)
        }

        return formatter.date(from: self)
    }
}
