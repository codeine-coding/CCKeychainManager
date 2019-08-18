//
//  KeychainManager.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/14/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

final public class CCKeychainManager {
    private var accessToken: KeychainItem
    private var refreshToken: KeychainItem
    
    public init(accessTokenItem: KeychainItem, refreshTokenItem: KeychainItem) {
        guard accessTokenItem != refreshTokenItem else {
            preconditionFailure(ErrorMessage.SimilarKeychainItems)
        }
        self.accessToken = accessTokenItem
        self.refreshToken = refreshTokenItem
    }
    
    
    
    public func setToken(for token: KeychainItemType, with secureData: String) throws {
        switch token {
        case .accessToken:
            try accessToken.saveItem(secureData)
        case .refreshToken:
            try refreshToken.saveItem(secureData)
        }
    }
    
    public func getToken(for token: KeychainItemType) throws -> String {
        switch token {
        case .accessToken:
            let data = try accessToken.readItem()
            return data
        case .refreshToken:
            let data = try refreshToken.readItem()
            return data
        }
    }
    
    public func removeToken(for item: KeychainItemType) throws {
        switch item {
        case .accessToken:
            try accessToken.deleteItem()
        case .refreshToken:
            try refreshToken.deleteItem()
        }
    }
}
