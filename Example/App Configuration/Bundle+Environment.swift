//
//  Bundle+Environment.swift
//  Example
//
//  Created by KITAUTHOR on KITDATE.
//  Copyright © KITYEAR KITORGANIZATION. All rights reserved.
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
    var version: String { return infoDictionaryValue(for: BundleKey.shortVersionString.rawValue) }

    /// String value for CFBundleVersion.
    var build: String { return infoDictionaryValue(for: BundleKey.bundleVersion.rawValue) }

    /// String value for CFBundleIdentifier.
    var buildIdentifier: String { return infoDictionaryValue(for: BundleKey.bundleIdentifier.rawValue) }

    func infoDictionaryValue(for key: String) -> String {
        return (Bundle.main.infoDictionary?[key] as? String) ?? ""
    }

    var environmentSetting: NSDictionary { return (Bundle.main.infoDictionary?[PlistKey.appSettings.rawValue] as? NSDictionary) ?? NSDictionary() }
}
