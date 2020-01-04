//
//  NotificationCenter+AutoUnregisterTests.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Foundation
import Nimble
import Quick

@testable import MobileCI

let testNotification = Notification.Name(rawValue: "NotificationUnregisteringTestsNotification")
let operationQueueNotification = Notification.Name(rawValue: "OperationQueueNotification")

class NotificationCenter_AutoUnregisterTests: QuickSpec {
    override func spec() {

        describe("AutoUnregister as notification observer") {
            var counter = 0
            var token: NotificationToken?

            // MARK: Setup

            beforeEach {
                counter = 0
                token = NotificationCenter.default.observe(name: testNotification, object: nil, queue: nil) { _ in
                    counter += 1
                }
            }

            afterEach {
                token = nil
            }

            context("post a single notification") {
                it("should unregister on deinit") {
                    // Posting a notification should increment the counter
                    NotificationCenter.default.post(name: testNotification, object: nil)

                    expect(counter) == 1
                }
            }

            context("post 2 notifications setting observer token to nil between the 1st and 2nd notification") {

                it("should unregister on deinit") {

                    NotificationCenter.default.post(name: testNotification, object: nil)

                    if token != nil { token = nil }

                    NotificationCenter.default.post(name: testNotification, object: nil)

                    // Observer block isn't executed again
                    expect(counter) == 1
                }
            }

            context("notification center observer block") {
                it("should have a count of 1 notification") {
                    NotificationCenter.default.post(name: testNotification, object: nil)

                    expect(counter) == 1
                }

                it("fails to unregister causing block to stay alive after token released") {
                    var counter = 0
                    var token: Any?

                    token = NotificationCenter.default.addObserver(forName: testNotification, object: nil, queue: nil) { _ in
                        counter += 1
                    }

                    // Posting notification increments counter (as expected)
                    NotificationCenter.default.post(name: testNotification, object: nil)

                    expect(counter) == 1

                    // Destroy observation token
                    if token != nil { token = nil }

                    // Post notification again
                    NotificationCenter.default.post(name: testNotification, object: nil)

                    // Increments counter again!
                    expect(counter) == 2
                }
            }
        }

        describe("Observer token for main queue operation") {
            context("post on main thread") {
                it("invoked post notification") {
                    let notificationCenter = NotificationCenterSpy()
                    notificationCenter.postOnMainThread(name: operationQueueNotification)

                    DispatchQueue.main.async {
                        expect(notificationCenter.postNotificationInvoked) == true
                    }
                }
            }
        }
    }
}
