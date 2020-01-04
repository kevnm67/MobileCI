//
//  MockTableViewDatasource.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Foundation
import UIKit

class MockTableViewDatasource: NSObject, UITableViewDataSource {

    public typealias SectionModel = [String]

    var isEmpty = false

    var data: [SectionModel] = []

    // MARK: -

    convenience init(data: [SectionModel], isEmpty: Bool = false) {
        self.init()
        self.isEmpty = isEmpty
        self.data = data
    }

    // MARK: Datasource

    func numberOfSections(in _: UITableView) -> Int {
        isEmpty ? 0 : data.count
    }

    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        isEmpty ? 0 : data[section].count
    }

    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}
