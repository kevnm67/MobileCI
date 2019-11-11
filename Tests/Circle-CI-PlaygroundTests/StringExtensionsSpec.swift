//
//  StringExtensionsSpec.swift
//  CircleCI
//
//  Created by Kevin Morton on 11/2/19.
//  Copyright © 2019 Circle-CI-Playground. All rights reserved.
//

import Nimble
import Quick

@testable import CircleCI

class StringExtensionsSpec: QuickSpec {
    override func spec() {

        describe("A string") {
            context("isWhitespace") {
                it("is truthy when empty") {
                    expect("".isWhitespace).to(beTruthy())
                }

                it("is truthy when only spaces") {
                    expect("  ".isWhitespace).to(beTruthy())
                }

                it("is falsy when only letters") {
                    expect("string".isWhitespace).to(beFalsy())
                }

                it("is falsy letters and spaces") {
                    expect("  string".isWhitespace).to(beFalsy())
                }
            }
        }
    }
}
