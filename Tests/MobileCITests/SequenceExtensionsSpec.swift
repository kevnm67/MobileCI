//
//  SequenceExtensionsSpec.swift
//
//  Created by Kevin Morton. on 1/4/20.
//  Copyright © 2020 KJM. All rights reserved.
//

import Nimble
import Quick

@testable import MobileCI

class SequenceExtensionsSpec: QuickSpec {
    override func spec() {

        describe("A numeric sequence") {
            let given = [1, 2, 3, 4, 8, 12]

            it("returns truthy for .all") {
                expect(given.all { $0 < 13 }).to(beTruthy())
            }

            it("returns falsy for .all") {
                expect(given.all { $0 > 13 }).to(beFalsy())
            }

            it("returns truthy for .any") {
                expect(given.any { $0 != 3 }).to(beTruthy())
            }

            it("returns falsy for .any") {
                expect(given.any { $0 == 113 }).to(beFalsy())
            }

            it("returns falsy for .none") {
                expect(given.none { $0 != 3 }).to(beFalsy())
            }

            it("returns truthy for .none") {
                expect(given.none { $0 == 113 }).to(beTruthy())
            }

            it("returns expected sum") {
                expect([1, 2, 3].sum()) == 6
            }
        }

        describe("A collection of strings") {
            let given = ["bill", "john", "jill", "amy"]

            it("returns truthy for .all") {
                expect(given.all { $0.count > 1 }).to(beTruthy())
            }

            it("returns falsy for .all") {
                expect(given.all { $0 == "timmy" }).to(beFalsy())
            }

            it("removes jill") {
                expect(given.reject { $0 == "jill" }.contains("jill")).to(beFalsy())
            }

            context("when rejecting a name not contained in the collection") {
                it("returns original collection") {
                    expect(given.reject { $0 == "dakota" }) == given
                }
            }
        }
    }
}
