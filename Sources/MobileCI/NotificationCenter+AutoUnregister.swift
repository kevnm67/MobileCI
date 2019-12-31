//
//  NotificationCenter+AutoUnregister.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Foundation

/// 🚲 [Wraps the observer token](https://oleb.net/blog/2018/01/notificationcenter-removeobserver/)
/// received from NotificationCenter.addObserver(forName:object:queue:using:) and unregisters it in deinit.
///
final class NotificationToken: NSObject {

    let notificationCenter: NotificationCenter
    let token: Any

    // MARK: Init

    init(notificationCenter: NotificationCenter = .default, token: Any) {
        self.notificationCenter = notificationCenter
        self.token = token
    }

    deinit {
        print("NotificationToken deinit: unregistering")

        notificationCenter.removeObserver(token)
    }
}

extension NotificationCenter {

    /// Convenience wrapper for addObserver(forName:object:queue:using:) returning our custom NotificationToken.
    func observe(name: NSNotification.Name?, object obj: Any?, queue: OperationQueue? = .main, using block: @escaping (Notification) -> Void) -> NotificationToken {
        let token = addObserver(forName: name, object: obj, queue: queue, using: block)

        return NotificationToken(notificationCenter: self, token: token)
    }

    /// Async posts the notification on the main thread.
    ///
    /// - Parameter name: Notification.Name
    func postOnMainThread(name: Notification.Name) {
        DispatchQueue.main.async {
            self.post(name: name, object: nil)
        }
    }
}
