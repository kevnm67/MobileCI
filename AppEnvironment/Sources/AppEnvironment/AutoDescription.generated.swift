// Generated using Sourcery 0.17.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable vertical_whitespace

import Foundation

extension Environment: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String { return debugDescription }

    public var debugDescription: String {
        return [
           "provider : \(String(describing: self.provider))", 
         "environment : \(String(describing: self.environment))", 
         "name : \(String(describing: self.name))", 
         "rootURL : \(String(describing: self.rootURL))", 
         "isTesting : \(String(describing: self.isTesting))", 
         "isRelease : \(String(describing: self.isRelease))"].joined(separator: "\n")
    }
}
