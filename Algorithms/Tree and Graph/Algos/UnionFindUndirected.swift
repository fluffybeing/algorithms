//
//  UnionFindUndirected.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/5/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// Reference: https://www.hackerearth.com/practice/notes/disjoint-set-union-union-find/

// Approach 1
// This can be used just to find connected components
// I was not able to find the cycle
struct UnionFindUndirected<T: Hashable>{
  private var set: Dictionary<T, T>
  private let graph: AdjancencyListGraph<T>
    
  init(graph: AdjancencyListGraph<T>) {
    // Intial set array refers
    // 0 -> 0, 1 -> 1, it means all nodes
    // are in different set
    self.graph = graph
    self.set = Dictionary<T, T>()
  
    for edges in graph.adjacencyDict.values {
      for edge in edges {
        set[edge.source.data] = edge.source.data
      }
    }
  
    self.combineConnnectedNodes()
  }
  
  private mutating func combineConnnectedNodes() {
    for edge in graph.adjacencyDict.values.flatMap({ $0 }) {
      union(a: edge.source.data, b: edge.destination.data)
    }
  }
    
  public func isCycle(source: T, destination: T) -> Bool {
    return find(a: source, b: destination)
  }
    
  public func find(a: T, b: T) -> Bool {
    if set[a] == set[b] {
      return true
    }
    return false
  }
  
  // the logic here is broken
  // To connect a node with other say we have three nodes
  // [0:0, 1:1, 2:2] and now we want to connect 1-2 then the set will be
  // [0:0, 1:1, 2:1]
  public mutating func union(a: T, b: T) {
    let oldSet = set[a]
    
    for key in set.keys {
      if set[key] == oldSet {
        set[key] = set[b]
      }
    }
  }
}


func unionFindUndirectedTest() {
    
  let graph = AdjancencyListGraph<Int>()
  
  let zero = graph.createVertex(data: 0)
  let one = graph.createVertex(data: 1)
  let two = graph.createVertex(data: 2)
  let three = graph.createVertex(data: 3)
  let four = graph.createVertex(data: 4)
  let seven = graph.createVertex(data: 7)
  let eight = graph.createVertex(data: 8)
  let nine = graph.createVertex(data: 9)
  
  // Graph, three connected components
  //        0 --- 1
  //        2 --- 3 --- 4
  //        7 --- 9 --- 8 // cycle
  
  graph.add(.undirected, from: zero, to: one, weight: nil)
  graph.add(.undirected, from: two, to: three, weight: nil)
  graph.add(.undirected, from: three, to: four, weight: nil)
  graph.add(.undirected, from: seven, to: nine, weight: nil)
  graph.add(.undirected, from: eight, to: nine, weight: nil)
  graph.add(.undirected, from: eight, to: seven, weight: nil)


  let a = UnionFindUndirected(graph: graph)
  assert(a.isCycle(source: 9, destination: 7) == true)
}

// TODO optimized version of it
// above implementation take O(N^2)


