//
//  SequenceExtensions.swift
//  CircleCI-iOS
//
//  Created by Kevin Morton on 10/13/19.
//  Copyright © 2019 CircleCI. All rights reserved.
//

import Foundation

public extension Sequence {

    /// Whether all elements of the collection match the given condition.
    /// - Parameter condition: Condition to evaluate all elements.
    func all(matching condition: (Element) throws -> Bool) rethrows -> Bool {
        return try !contains { try !condition($0) }
    }

    /// Whether no elements match the given condition.
    /// - Parameter condition: Condition to evaluate each element.
    func none(matching condition: (Element) throws -> Bool) rethrows -> Bool {
        return try !contains { try condition($0) }
    }

    /// Whether any element matches the given condtion.
    /// - Parameter condition: Condition to evaluate all elements.
    func any(matching condition: (Element) throws -> Bool) rethrows -> Bool {
        return try contains { try condition($0) }
    }

    /// Remove all elements matching the given condition.  Returns all non-matching elements.
    /// - Parameter condition: Condition to evaluate all elements.
    func reject(where condition: (Element) throws -> Bool) rethrows -> [Element] {
        return try filter { try !condition($0) }
    }
}

// MARK: -

public extension Sequence where Element: Numeric {

    /// Sum of all elements in the given sequence.
    func sum() -> Element {
        return reduce(into: 0, +=)
    }
}
