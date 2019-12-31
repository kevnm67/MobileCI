//
//  ViewController.swift
//  Example
//
//  Created by Kevin Morton on Jan 5, 2020.
//  Copyright © 2020 kevnm67. All rights reserved.
//

import MobileCI
import UIKit

class ViewController: UIViewController {

    // MARK: Properties

    /// Description label.
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = [
            "🚀 MobileCI Example",
            "\(environment)",
            "\(version)"
        ].joined(separator: "\n")

        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center

        return label
    }()

    var environment: String { "Environment: \(Environment.shared.description)" }

    var version: String {
        return [
            "Version: \(Bundle.main.version)",
            "Build: \(Bundle.main.build)"
        ].joined(separator: "\n")
    }

    // MARK: View-Lifecycle

    /// View did load
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    }

    /// LoadView
    override func loadView() {
        view = label
    }
}
