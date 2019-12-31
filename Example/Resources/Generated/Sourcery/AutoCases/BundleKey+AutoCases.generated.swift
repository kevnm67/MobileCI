// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// MARK: BundleKey

public extension BundleKey {
    enum CaseName: String, CaseIterable {
        case shortVersionString
        case bundleVersion
        case bundleIdentifier
        case bundleName
    }

    var caseName: CaseName {
        switch self {
        case .shortVersionString: return .shortVersionString
        case .bundleVersion: return .bundleVersion
        case .bundleIdentifier: return .bundleIdentifier
        case .bundleName: return .bundleName
        }
    }
}
