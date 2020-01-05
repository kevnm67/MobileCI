//
//  Environment.swift
//  Example
//
//  Created by KITAUTHOR on KITDATE.
//  Copyright © KITYEAR KITORGANIZATION. All rights reserved.
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

    public var key: String { return caseName.rawValue }
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
        return provider.environmentSetting(for: key)
    }

    var environment: Environment.Name? {
        return provider.environment
    }

    var name: String {
        return provider.name
    }

    var rootURL: String {
        return provider.rootURL
    }

    var isTesting: Bool {
        return provider.isTesting
    }

    var isRelease: Bool {
        return provider.isRelease
    }
}
