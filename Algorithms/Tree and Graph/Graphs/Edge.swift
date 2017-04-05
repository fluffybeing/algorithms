//
//  Edge.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/28/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public var weight: Double?
}

extension Edge: Hashable {
    public var hashValue: Int {
        return "\(source)\(destination)\(String(describing: weight))".hashValue
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
            lhs.destination == rhs.destination &&
            lhs.weight == rhs.weight
    }
}
