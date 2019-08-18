//
//  QueryCreatable.swift
//  AuthentItApp
//
//  Created by Allen Whearry on 8/15/19.
//  Copyright © 2019 Allen Whearry. All rights reserved.
//

import Foundation

public protocol QueryCreatable: class {
    func createQuery() -> [String: Any]
}

public extension QueryCreatable {
    var query: [String: Any] {
        get { return createQuery() }
    }
}
