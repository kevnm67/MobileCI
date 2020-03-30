//
//  UIApplication+Environment.swift
//

// swiftformat:disable all
#if canImport(UIKit)
// swiftformat:enable all
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

// swiftformat:disable all
#endif
// swiftformat:enable all
