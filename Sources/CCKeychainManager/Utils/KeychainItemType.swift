//
//  KeychainItemType.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/15/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

public enum KeychainItemType {
    case accessToken
    case refreshToken
    
    public var label: String {
        switch self {
        case .accessToken:
            return "AccessToken"
        case .refreshToken:
            return "RefreshToken"
        }
    }
}
