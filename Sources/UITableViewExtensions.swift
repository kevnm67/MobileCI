//
//  UITableViewExtensions.swift
//  CircleCI-iOS
//
//  Created by Kevin Morton on 11/2/19.
//  Copyright © 2019 Circle-CI-Playground. All rights reserved.
//

import UIKit

public extension UITableView {

    /// IndexPath of the tableviews last row.
    var indexPathForLastRow: IndexPath? {
        guard let lastSection = lastSection else { return nil }
        return indexPathForLastRow(inSection: lastSection)
    }

    /// Index of the tableviews last section.
    var lastSection: Int? {
        return numberOfSections > 0 ? numberOfSections - 1 : nil
    }

    func indexPathForLastRow(inSection section: Int) -> IndexPath? {
        guard numberOfSections > 0, section >= 0 else { return nil }

        let rowsInSection = numberOfRows(inSection: section)

        guard rowsInSection > 0 else {
            return IndexPath(row: 0, section: section)
        }

        return IndexPath(row: rowsInSection - 1, section: section)
    }
}
