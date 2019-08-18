//
//  KeychainItemConfig.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/14/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

final public class KeychainItemConfig: BaseItemConfiguration {
    override public func createQuery() -> [String: Any] {
        var query = [String: Any]()
        query[kSecClass as String] = kSecClassInternetPassword
        query[kSecAttrLabel as String] = keyLabel
        query[kSecAttrServer as String] = server
        
        return query
    }
}
