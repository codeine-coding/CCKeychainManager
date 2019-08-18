//
//  BaseItemConfig.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/15/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

open class BaseItemConfiguration: BaseItem {
    private(set) public var keyLabel: String
    private(set) public var server: String
    
    public init(keyLabelFor item: KeychainItemType, server: String) {
        self.keyLabel = item.label
        self.server = server
    }
    
    open func createQuery() -> [String : Any] {
        fatalError(ErrorMessage.BaseItemConfigCreateQuery)
    }
}
