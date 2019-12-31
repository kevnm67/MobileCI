// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// MARK: EnvironmentSettings

public extension EnvironmentSettings {
    enum CaseName: String, CaseIterable {
        case displayName = "Display name"
        case bundleSuffix = "Bundle ID Suffix"
        case environment = "Environment"
        case rootURL = "Root URL"
        case developerName = "Install Owner"
    }

    var caseName: CaseName {
        switch self {
        case .displayName: return .displayName
        case .bundleSuffix: return .bundleSuffix
        case .environment: return .environment
        case .rootURL: return .rootURL
        case .developerName: return .developerName
        }
    }
}
