//
//  UITableViewExtensions.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import UIKit

public extension UITableView {

    /// IndexPath of the tableviews last row.
    var indexPathForLastRow: IndexPath? {
        guard let lastSection else { return nil }
        return indexPathForLastRow(inSection: lastSection)
    }

    /// Index of the tableviews last section.
    var lastSection: Int? {
        numberOfSections > 0 ? numberOfSections - 1 : nil
    }

    // MARK: Internal

    /// IndexPath of the last row in a given section or nil.
    /// - Parameter section: Section to evaluate.
    func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard numberOfSections > 0, section >= 0 else { return nil }

        let rowsInSection = numberOfRows(inSection: section)

        guard rowsInSection > 0 else {
            return IndexPath(row: 0, section: section)
        }

        return IndexPath(row: rowsInSection - 1, section: section)
    }
}
