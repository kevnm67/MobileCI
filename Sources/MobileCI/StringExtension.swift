//
//  StringExtension.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Foundation

public extension String {

    /// Whether a given string is comprised of whitespace and newlines.
    var isWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
