//
//  FailureMessages.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/16/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

enum ErrorMessage {
    static let SimilarKeychainItems = "Access token and refresh token cannot have the same Item Type. Check your KeychainItemConfig init  parameter 'keyLabelFor' or make sure KeychainItem config were set differntly"
    
    static let BaseItemConfigCreateQuery = "Subclasses of 'BaseItemConfiguration' must override 'createQuery()'"
}
