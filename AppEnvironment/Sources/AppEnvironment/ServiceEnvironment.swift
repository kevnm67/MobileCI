//
//  ServiceEnvironment.swift
//

import Foundation

/// Interface describing the current  API environment (e.g. qa, staging, production, etc.)
public protocol ServiceEnvironmentInterface {

    /// API base path.
    var rootURLString: String { get }

    /// Current app environment (e.g. QA, staging, release)
    var environment: Environment.Name { get }
}

// MARK: -

public struct ServiceEnvironment {

    public let environmentProvider: ServiceEnvironmentInterface

    public static var env = ServiceEnvironment()

    // MARK: Init

    public init(_ environmentProvider: ServiceEnvironmentInterface = DefaultServiceEnvironment()) {
        self.environmentProvider = environmentProvider
    }
}

// MARK: -

extension ServiceEnvironment: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String { debugDescription }

    public var debugDescription: String {
        [
            "rootURLString: \(self.environmentProvider.rootURLString)",
            "env : \(String(describing: self.environmentProvider.environment.self))"
        ].joined(separator: "\n")
    }
}

// MARK: -

public struct DefaultServiceEnvironment: ServiceEnvironmentInterface {

    public init() {}

    public var environment: Environment.Name {
        Environment.shared.environment ?? Environment.Name.release
    }

    public var rootURLString: String {
        Environment.shared.rootURL
    }
}
