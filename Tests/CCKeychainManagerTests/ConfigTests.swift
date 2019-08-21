//
//  ConfigTests.swift
//  
//
//  Created by Allen Whearry on 8/20/19.
//

import XCTest
@testable import CCKeychainManager

final class ConfigTests: XCTestCase {
    var accessConfig: KeychainItemConfig!
    var refreshConfig: KeychainItemConfig!
    override func setUp() {
        super.setUp()
        accessConfig = KeychainItemConfig(keyLabelFor: .accessToken, server: "testServer")
        refreshConfig = KeychainItemConfig(keyLabelFor: .refreshToken, server: "testServer")
    }
    
    override func tearDown() {
        super.tearDown()
        accessConfig = nil
        refreshConfig = nil
    }
    
    func testAccesConfig_NotNil() {
        XCTAssertNotNil(accessConfig)
    }
    
    func testRefreshConfig_NotNil() {
        XCTAssertNotNil(refreshConfig)
    }
    
    func testAccessConfig_IsNotEqualTo_RefeshConfig() {
        XCTAssertTrue(accessConfig != refreshConfig)
    }
    
//    static var allTests = [
//        ("testAccessConfig_IsNotEqualTo_RefeshConfig", testAccessConfig_IsNotEqualTo_RefeshConfig),
//    ]
}
