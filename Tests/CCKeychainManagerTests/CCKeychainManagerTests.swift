import XCTest
@testable import CCKeychainManager

final class CCKeychainManagerTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(CCKeychainManager().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
