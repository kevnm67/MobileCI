//
//  Bundle+Environment.swift
//

import Foundation

// MARK: -

public enum PlistKey: String {
    case appSettings = "EnvironmentSettings"
}

// MARK: -

public enum BundleKey: String, AutoCaseName {
    case shortVersionString = "CFBundleShortVersionString"
    case bundleVersion = "CFBundleVersion"
    case bundleIdentifier = "CFBundleIdentifier"
    case bundleName = "CFBundleName"
}

// MARK: -

public extension Bundle {

    var bundleName: String {
        let name = infoDictionaryValue(for: BundleKey.bundleName.rawValue)

        return name.isEmpty ? "Info.plist" : name
    }

    /// String value for CFBundleShortVersionString.
    var version: String { infoDictionaryValue(for: BundleKey.shortVersionString.rawValue) }

    /// String value for CFBundleVersion.
    var build: String { infoDictionaryValue(for: BundleKey.bundleVersion.rawValue) }

    /// String value for CFBundleIdentifier.
    var buildIdentifier: String { infoDictionaryValue(for: BundleKey.bundleIdentifier.rawValue) }

    func infoDictionaryValue(for key: String) -> String {
        (Bundle.main.infoDictionary?[key] as? String) ?? ""
    }

    var environmentSetting: NSDictionary { (Bundle.main.infoDictionary?[PlistKey.appSettings.rawValue] as? NSDictionary) ?? NSDictionary() }
}
