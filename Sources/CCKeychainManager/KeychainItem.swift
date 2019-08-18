//
//  KeychainItem.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/14/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

public struct KeychainItem: Equatable {
    
    private(set) var config: BaseItemConfiguration
    
    public init(config: BaseItemConfiguration) {
        self.config = config
    }
    
    
    @discardableResult
    func readItem() throws -> String {
        var query = config.query
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnData as String] = true
        
        var queryResult: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &queryResult)
        
        switch status {
        case noErr:
            let passwordData = queryResult as? Data ?? Data()
            return String(decoding: passwordData, as: UTF8.self)
        case errSecItemNotFound:
            throw KeychainError.noPassword
        default:
            throw KeychainError.unhandledError
        }
    }
    
    func saveItem(_ secureData: String) throws {
        guard let encodedSecureData = secureData.data(using: .utf8) else { return }
        
        do {
            try readItem()
            var attributesToUpdate = [String: Any]()
            
            attributesToUpdate[kSecValueData as String] = encodedSecureData
            
            let query = config.query
            let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            
            guard status == noErr else { throw KeychainError.unhandledError }
        } catch KeychainError.noPassword {
            var newItem = config.query
            newItem[kSecValueData as String] = encodedSecureData
            
            let status = SecItemAdd(newItem as CFDictionary, nil)
            
            guard status == errSecSuccess else { throw KeychainError.unhandledError }
        }
    }
    
    func deleteItem() throws {
        // Delete the existing item from the keychain.
        let query = config.query
        let status = SecItemDelete(query as CFDictionary)
        
        // Throw an error if an unexpected status was returned.
        guard status == noErr || status == errSecItemNotFound else { throw KeychainError.unhandledError }
    }
    
}

extension KeychainItem {
    public static func == (lhs: KeychainItem, rhs: KeychainItem) -> Bool {
        return lhs.config.keyLabel == rhs.config.keyLabel
    }
}
