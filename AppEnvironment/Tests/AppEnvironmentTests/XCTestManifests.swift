import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(AppEnvironmentTests.allTests)
    ]
}
#endif
