//
//  ViewController.swift
//  Example
//
//  Created by Kevin Morton on Jan 5, 2020.
//  Copyright © 2020 kevnm67. All rights reserved.
//

import AppEnvironment
import MobileCI
import UIKit

struct AppInfo {

    static var environment: String { "\(Environment.shared.description)" }

    static var version: String {
        return [
            "Version: \(Bundle.main.version)",
            "Build: \(Bundle.main.build)"
        ].joined(separator: " ")
    }
}

// MARK: -

class ViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var versionLabel: UILabel!

    @IBOutlet weak var environmentLabel: UILabel!

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
}

extension ViewController {

    // MARK: Setup

    fileprivate func configureView() {
        versionLabel.text = AppInfo.version
        environmentLabel.text = "\(AppInfo.environment)"
    }
}

