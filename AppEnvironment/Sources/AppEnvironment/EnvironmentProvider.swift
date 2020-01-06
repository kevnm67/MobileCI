//
//  EnvironmentProvider.swift
//

import Foundation
import UIKit

// MARK: -

public protocol EnvironmentProvider {

    /// Current environment type.
    var environment: Environment.Name? { get }

    /// Environments name.
    var name: String { get }

    /// Returns the current environments root url (i.e. appSettings(for: .rootURL))
    var rootURL: String { get }

    /// Whether running unit tests.
    var isTesting: Bool { get }

    /// Returns the value for nextraq specific settings in the info.plist.
    /// - Parameter type: Environment settings key.
    func environmentSetting(for type: EnvironmentSettingType) -> String
}

// MARK: -

public extension EnvironmentProvider {

    var environment: Environment.Name? {
        return Environment.Name(rawValue: environmentSetting(for: EnvironmentSettings.environment))
    }

    var name: String {
        return environment.map { $0.rawValue } ?? Environment.Name.release.rawValue
    }

    var rootURL: String {
        return environmentSetting(for: EnvironmentSettings.rootURL)
    }

    var isTesting: Bool {
        guard !isRelease else { return false }

        if case .release = Environment.shared.environment { return false }

        return UIApplication.shared.isDebugEnvironment
    }

    var isRelease: Bool { return environment == .release }

    /// Access to the info.plist dictionary values for the app specific settings.
    ///
    /// - Parameter type: Dictionary key for the app setting.
    /// - Returns: Value for the app specific setting.
    func environmentSetting(for type: EnvironmentSettingType) -> String {
        return Bundle.main.environmentSetting[type.key] as? String ?? ""
    }
}

// MARK: -

public struct DefaultEnvironmentProvider: EnvironmentProvider {}
