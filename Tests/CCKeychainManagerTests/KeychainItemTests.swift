//
//  File.swift
//  
//
//  Created by Allen Whearry on 8/20/19.
//

import XCTest
@testable import CCKeychainManager

final class KeychainItemTests: XCTestCase {
    var accessConfig: KeychainItemConfig!
    var refreshConfig: KeychainItemConfig!
    
    var accessItem: KeychainItem!
    var refreshItem: KeychainItem!
    
    override func setUp() {
        accessConfig = KeychainItemConfig(keyLabelFor: .accessToken, server: "testServer")
        refreshConfig = KeychainItemConfig(keyLabelFor: .refreshToken, server: "testServer")
        
        accessItem = KeychainItem(config: accessConfig)
        refreshItem = KeychainItem(config: refreshConfig)
    }
    
    override func tearDown() {
        accessItem = nil
        refreshItem = nil
    }
    
    func testAccessItem_NotNil() {
        XCTAssertNotNil(accessItem)
    }
    
    func testRefreshItem_NotNil() {
        XCTAssertNotNil(refreshItem)
    }
    
    func testAccessItem_NotEqualTo_RefreshItem() {
        XCTAssertTrue(accessItem != refreshItem)
    }
    
    func testAccessItem_CanMatchEqualItem() {
        let testAccessConfig = KeychainItemConfig(keyLabelFor: .accessToken, server: "testServer")
        let testAccessItem = KeychainItem(config: testAccessConfig)
        
        XCTAssertTrue(accessItem == testAccessItem)
    }
}
