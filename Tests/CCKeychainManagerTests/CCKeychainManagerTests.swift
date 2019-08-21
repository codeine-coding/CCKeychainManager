import XCTest
@testable import CCKeychainManager

final class CCKeychainManagerTests: XCTestCase {
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
}
