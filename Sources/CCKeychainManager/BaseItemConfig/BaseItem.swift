//
//  File.swift
//  
//
//  Created by Allen Whearry on 8/18/19.
//

import Foundation

public protocol BaseItem: QueryCreatable {
    var keyLabel: String { get }
    var server: String { get }
}
