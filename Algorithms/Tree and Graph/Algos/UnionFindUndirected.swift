//
//  UnionFindUndirected.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/5/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// Reference: https://www.hackerearth.com/practice/notes/disjoint-set-union-union-find/

func union(set: inout [Int], a: Int, b: Int) {
    let temp = set[a]
    
    // We are looping here because
    // we want to update the set. For example, if two nodes
    // were already connected and then the thirds comes then we need 
    // to update all three nodes to same set
    for i in 0..<set.count {
        if set[i] == temp {
            set[i] = set[b]
        }
    }
}

func find(set: inout [Int], a: Int, b: Int) -> Bool {
    if set[a] == set[b] {
        return true
    }
    return false
}

// detect cycle in undirected graph
func unionFindUndirected(edges: [Edge<Int>], a: Int, b: Int, verticesCount: Int) -> Bool {
    
    // Intial set array refers
    // 0 -> 0, 1 -> 1, it means all nodes
    // are in different set
    var set = Array(0..<verticesCount)
    
    for edge in edges {
        union(set: &set, a: edge.source.data, b: edge.destination.data)
    }
    
    return find(set: &set, a: a, b: b)
}


func unionFindUndirectedTest() {
    
    var edges = [Edge<Int>]()
    
    edges.append(Edge(source: Vertex(data: 0), destination: Vertex(data: 1), weight: nil))
    edges.append(Edge(source: Vertex(data: 2), destination: Vertex(data: 3), weight: nil))
    edges.append(Edge(source: Vertex(data: 3), destination: Vertex(data: 4), weight: nil))
    
    edges.append(Edge(source: Vertex(data: 7), destination: Vertex(data: 9), weight: nil))
    edges.append(Edge(source: Vertex(data: 8), destination: Vertex(data: 9), weight: nil))
    
    print(unionFindUndirected(edges: edges, a: 4, b: 2, verticesCount: 10))
}
