//
//  NotificationNameExtensions.swift
//  CircleCI-iOS
//
//  Created by Kevin Morton on 10/13/19.
//  Copyright © 2019 CircleCI. All rights reserved.
//

import Foundation

/// Notification.Name extension to allow names to be expressed via enums.
///
///     switch MyNotification(rawValue: notification.name) {
///         case .modelChanged:
///              break
///          case .refreshList:
///             break
///      }
///
///
extension Notification.Name: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self.init(value)
    }

    public init(extendedGraphemeClusterLiteral value: String) {
        self.init(value)
    }

    public init(unicodeScalarLiteral value: String) {
        self.init(value)
    }
}
