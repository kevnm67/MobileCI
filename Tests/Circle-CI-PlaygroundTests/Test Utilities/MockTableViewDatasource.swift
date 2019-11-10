//
//  MockTableView.swift
//  CircleCI-iOS Tests
//
//  Created by Kevin Morton on 11/10/19.
//  Copyright © 2019 Circle-CI-Playground. All rights reserved.
//

import Foundation
import UIKit

class MockTableViewDatasource: NSObject, UITableViewDataSource {

    public typealias SectionModel = [String]

    var data: [SectionModel] = []

    // MARK: -

    convenience init(data: [SectionModel]) {
        self.init()

        self.data = data
    }

    // MARK: Datasource

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
