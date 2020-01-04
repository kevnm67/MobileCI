//
//  StringExtensionsSpec.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Nimble
import Quick

@testable import MobileCI

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
