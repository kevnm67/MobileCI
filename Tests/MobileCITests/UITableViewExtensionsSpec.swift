//
//  UITableViewExtensionsSpec.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Nimble
import Quick
import UIKit
@testable import MobileCI

class UITableViewExtensionsSpec: QuickSpec {
    override func spec() {

        describe("A TableView") {
            var indexPathOfFirstItem: IndexPath!
            var tableView: UITableView!

            beforeEach {
                indexPathOfFirstItem = IndexPath(row: 0, section: 0)
                tableView = UITableView()
            }

            it("returns 0 for last section") {
                expect(tableView.lastSection) == 0
            }

            it("returns row 0 section 0 for indexPathForLastRow") {
                expect(tableView.indexPathForLastRow) == indexPathOfFirstItem
            }

            context("when number of sections is not greate than zero") {
                var datasource: MockTableViewDatasource!

                beforeEach {
                    datasource = MockTableViewDatasource()
                    datasource.isEmpty = true
                    tableView.dataSource = datasource
                }

                it("returns nil for indexPathForLastRow") {
                    expect(tableView.indexPathForLastRow).to(beNil())
                }

                it("returns nil for indexPathForLastRow in section -1") {
                    expect(tableView.indexPathForLastRow(inSection: -1)).to(beNil())
                }
            }

            context("multiple sections") {
                var datasource: MockTableViewDatasource!
                var data: [MockTableViewDatasource.SectionModel]!

                let section1 = ["1.0", "1.1", "1.2", "1.3", "1.4", "1.5"]
                let section2 = ["2.0", "2.1", "2.2", "2.3", "2.4", "2.5"]

                beforeEach {
                    data = [section1, section2]
                    datasource = MockTableViewDatasource(data: data)
                    tableView.dataSource = datasource
                }

                it("has last section equal to 1") {
                    expect(tableView.lastSection) == data.count - 1
                }

                it("equals expected indexPath for the last row") {
                    let expected = IndexPath(row: section2.count - 1, section: data.count - 1)

                    expect(tableView.indexPathForLastRow) == expected
                }
            }
        }
    }
}
