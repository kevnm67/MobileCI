//
//  UITableViewExtensionsSpec.swift
//  CircleCI
//
//  Created by Kevin Morton on 11/2/19.
//  Copyright © 2019 Circle-CI-Playground. All rights reserved.
//

import Nimble
import Quick

@testable import CircleCI

class UITableViewExtensionsSpec: QuickSpec {
    override func spec() {

        describe("A TableView") {
            let indexPathOfFirstItem = IndexPath(row: 0, section: 0)

            var tableView: UITableView!

            beforeEach {
                tableView = UITableView()
            }

            it("returns 0 for last section") {
                expect(tableView.lastSection).to(equal(0))
            }

            it("returns row 0 section 0 for indexPathForLastRow") {
                expect(tableView.indexPathForLastRow).to(equal(indexPathOfFirstItem))
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

                it("last section equals 1") {
                    expect(tableView.lastSection).to(equal(data.count - 1))
                }

                it("indexPathForLastRow equals") {
                    let expected = IndexPath(row: section2.count - 1, section: data.count - 1)

                    expect(tableView.indexPathForLastRow).to(equal(expected))
                }
            }
        }
    }
}
