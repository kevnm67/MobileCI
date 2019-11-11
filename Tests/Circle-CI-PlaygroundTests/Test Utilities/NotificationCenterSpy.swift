//
//  NotificationCenterSpy.swift
//  CircleCI-iOS
//
//  Created by Kevin Morton on 10/13/19.
//  Copyright © 2019 CircleCI. All rights reserved.
//

import Foundation

class NotificationCenterSpy: NotificationCenter {

    var removeObserverInvoked = false

    var postNotificationInvoked = false

    var postedNotification: Notification.Name?

    // MARK: Override

    override open func removeObserver(_: Any, name _: NSNotification.Name?, object _: Any?) {
        removeObserverInvoked = true
    }

    override open func post(name aName: NSNotification.Name, object _: Any?, userInfo _: [AnyHashable: Any]? = nil) {
        postNotificationInvoked = true
        postedNotification = aName
    }

    override open func post(_ notification: Notification) {
        postNotificationInvoked = true
        postedNotification = notification.name
    }
}
