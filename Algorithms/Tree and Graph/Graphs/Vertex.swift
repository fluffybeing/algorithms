//
//  Vertex.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/28/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

