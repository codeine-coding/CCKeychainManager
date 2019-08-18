//
//  KeychainError.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/14/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

enum KeychainError: Error {
    case noPassword
    case unexpectedItemData
    case unhandledError
}
