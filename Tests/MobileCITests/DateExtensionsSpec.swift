//
//  DateExtensionsSpec.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Nimble
import Quick
import Foundation
@testable import MobileCI

class DateExtensionsSpec: QuickSpec {
    override func spec() {

        describe("A date") {
            var date: Date!

            beforeEach {
                date = DateTestProvider.testDate("2019-02-15")
            }

            context("weekday") {
                it("equals 5") {
                    expect(date?.weekday) == 6
                }

                it("does not equal 3") {
                    expect(date?.weekday).notTo(equal(3))
                }
            }

            context("is today") {
                it("returns truthy") {
                    expect(Date().isInToday).to(beTruthy())
                }

                it("returns falsy") {
                    expect(date?.isInToday).to(beFalsy())
                }
            }

            context("is tomorrow") {
                var today: Date!

                beforeEach {
                    today = Date()
                }

                it("returns falsy") {
                    expect(today.isInTomorrow).to(beFalsy())
                }

                it("returns truthy") {
                    let tomorrow = today.calendar.date(byAdding: .day, value: 1, to: today)!
                    expect(tomorrow.isInTomorrow).to(beTruthy())
                }
            }

            context("is on the weekend") {
                it("returns truthy") {
                    let date = Date()
                    expect(date.isInWeekend) == Calendar.current.isDateInWeekend(date)
                }
            }

            context("is a workday") {
                it("returns truthy") {
                    let date = Date()
                    expect(date.isWorkday) == !Calendar.current.isDateInWeekend(date)
                }
            }
        }
    }
}
