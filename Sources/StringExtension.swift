//
//  StringExtension.swift
//  CircleCI-iOS
//
//  Created by Kevin Morton on 11/2/19.
//  Copyright © 2019 Circle-CI-Playground. All rights reserved.
//

import Foundation

public extension String {

    /// Whether a given string is comprised of whitespace and newlines.
    var isWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
