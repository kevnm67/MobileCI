//
//  SourceryProtocols.swift
//
//  Created by Kevin Morton on 11/14/19.
//

import Foundation

/// Conform to generate [hashable conforming code](https://bit.ly/2Lo9pi6).
///
/// - NOTE: skip code generation using annotations:
///
/// ```
/// /// sourcery: skipHashing, skipEquality
/// ```
public protocol AutoHashable {}

// MARK: - AutoEquatable for classes, protocols, structs

/// Generates equality for all types conforming to AutoEquatable or \
/// annotated with [AutoEquatable](https://bit.ly/2S9Eitn).
///
/// - NOTE:
///     Arrays:
///     - ```arrayEquality``` mark this to use array comparsion for variables with an \
///     array of items not implementing Equatable but have == operator e.g. Protocols
///
/// - Skip code generation:
///
/// ```
/// /// sourcery: skipHashing, skipEquality
/// ```
public protocol AutoEquatable {}

/// Phantom protocol to used by Sourcery to generate an enum extension with `CaseName`,
/// string representation, and CaseIterable conformance.
/// Use inline annotations to set the raw string value for you enum case:
///
/// ```
/// /// sourcery: asString = "my-custom-string"
/// ```
public protocol AutoCaseName {}

/// Conform to auto-generate a protocol interface.
public protocol AutoInterface {}

/// Autogenerates CustomStringConvertible & CustomDebugStringConvertible.
public protocol AutoDescription {}
