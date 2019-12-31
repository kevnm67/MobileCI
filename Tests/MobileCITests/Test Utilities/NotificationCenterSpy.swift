//
//  NotificationCenterSpy.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Foundation

class NotificationCenterSpy: NotificationCenter {

    var removeObserverInvoked = false

    var postNotificationInvoked = false

    var postedNotification: Notification.Name?

    // MARK: Override

    open override func removeObserver(_: Any, name _: NSNotification.Name?, object _: Any?) {
        removeObserverInvoked = true
    }

    open override func post(name aName: NSNotification.Name, object _: Any?, userInfo _: [AnyHashable: Any]? = nil) {
        postNotificationInvoked = true
        postedNotification = aName
    }

    open override func post(_ notification: Notification) {
        postNotificationInvoked = true
        postedNotification = notification.name
    }
}
