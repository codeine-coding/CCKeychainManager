import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CCKeychainManagerTests.allTests),
        testCase(ConfigTests.allTests),
    ]
}
#endif
