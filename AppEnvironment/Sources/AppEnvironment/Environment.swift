//
//  Environment.swift
//

import Foundation

public protocol EnvironmentSettingType {
    var key: String { get }
}

public enum EnvironmentSettings: EnvironmentSettingType, AutoCaseName {

    /// sourcery: asString = "Display name"
    case displayName

    /// sourcery: asString = "Bundle ID Suffix"
    case bundleSuffix

    /// sourcery: asString = "Environment"
    case environment

    /// sourcery: asString = "Root URL"
    case rootURL

    /// sourcery: asString = "Install Owner"
    case developerName

    public var key: String { caseName.rawValue }
}

// MARK: -

public struct Environment: AutoDescription {

    public enum Name: String, CaseIterable {
        case staging
        case dev
        case release = ""
    }

    /// sourcery: skipDescription
    public static let shared = Environment()

    public let provider: EnvironmentProvider

    // MARK: Init

    init(_ provider: EnvironmentProvider = DefaultEnvironmentProvider()) {
        self.provider = provider
    }
}

public extension Environment {

    /// Access to the info.plist dictionary values for env specific settings.
    ///
    /// - Parameter key: Dictionary key for an env specific setting.
    /// - Returns: Value for env setting.
    func environmentSetting(for key: EnvironmentSettingType) -> String {
        provider.environmentSetting(for: key)
    }

    var environment: Environment.Name? {
        provider.environment
    }

    var name: String {
        provider.name
    }

    var rootURL: String {
        provider.rootURL
    }

    var isTesting: Bool {
        provider.isTesting
    }

    var isRelease: Bool {
        provider.isRelease
    }
}
