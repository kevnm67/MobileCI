//
//  UIApplication+Environment.swift
//  Example
//
//  Created by KITAUTHOR on KITDATE.
//  Copyright © KITYEAR KITORGANIZATION. All rights reserved.
//

import UIKit

// MARK: -

public extension UIApplication {

    var isDebugEnvironment: Bool {
        #if DEBUG
            return true
        #else
            return UIDevice.current.isSimulator
        #endif
    }
}

// MARK: -

extension UIDevice {

    /// Check if running a simulator build.
    var isSimulator: Bool {
        #if targetEnvironment(simulator)
            return true
        #else
            return false
        #endif
    }
}
