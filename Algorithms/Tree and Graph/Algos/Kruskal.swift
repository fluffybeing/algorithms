//
//  Kruskal.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/5/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

struct Kruskal {
  private var set = [Int: Int]()
  private var edges: [Edge<Int>]?
  
  public var minimumSpaningTree = [Edge<Int>]()
  
  init(graph: AdjancencyListGraph<Int>) {
      for key in graph.adjacencyDict.keys {
          set[key.data] = -1
      }
      self.initialiseEdges(graph: graph)
      self.createSpanningTree()
  }
    
  private mutating func initialiseEdges(graph: AdjancencyListGraph<Int>) {
    // create the sorted list of edges in ascending value of
    // their weights
    var allEdges = [Edge<Int>]()
    for edges in graph.adjacencyDict.values {
        for edge in edges {
            allEdges.append(edge)
        }
    }
    self.edges = allEdges.sorted(by: { $0.weight! < $1.weight! })
  }
  
    // MARK: Union find
    private func parent(node: Int) -> Int {
      if set[node] == -1 {
          return node
      }
      return parent(node: set[node]!)
    }
    
    private mutating func union(nodeOne: Int, nodeTwo: Int) {
      set[nodeOne] = nodeTwo
    }
    
    //  0 1 2 3
    //  1 2 3 -1 Parent
    mutating func createSpanningTree() {
      if let edges = self.edges {
        // Iterate over the sorted edges
        // keep adding edges which doesn't form
        // a cycle
        for edge in edges {
          let parentSource = parent(node: edge.source.data)
          let parentDestination = parent(node: edge.destination.data)
        
          // if both the parent are same then retun true
          if !(parentSource == parentDestination) {
            union(nodeOne: edge.source.data, nodeTwo: edge.destination.data)
          
            // append this edge to spanning tree
            minimumSpaningTree.append(edge)
          } else {
              return
          }
        }
      }
    }
    
    public func printMinimumSpanningTree() -> String {
      let treeString = self.minimumSpaningTree
        .map { $0.source.description
          + "-"
          + $0.destination.description}
        .joined(separator: " ")
      
      let weightSum = self.minimumSpaningTree.reduce(0, { $0 + $1.weight!} )
      
      return "Tree: " + treeString + "\nTotal Sum of Weights: \(String(describing: weightSum))"
    }
}


// TODO: Remove away union find
func kruskalTest() {
  let graph = AdjancencyListGraph<Int>()
  
  let zero = graph.createVertex(data: 0)
  let one = graph.createVertex(data: 1)
  let two = graph.createVertex(data: 2)
  let three = graph.createVertex(data: 3)
  let four = graph.createVertex(data: 4)
  let seven = graph.createVertex(data: 7)
  let eight = graph.createVertex(data: 8)
  let nine = graph.createVertex(data: 9)

  // graphs needs to be connected with all the nodes
  graph.add(.directed, from: zero, to: one, weight: 3)
  graph.add(.directed, from: one, to: two, weight: 9)
  graph.add(.directed, from: two, to: three, weight: 5)
  graph.add(.directed, from: three, to: four, weight: 2)
  graph.add(.directed, from: seven, to: nine, weight: 7)
  graph.add(.directed, from: eight, to: nine, weight: 1)
  graph.add(.directed, from: two,  to: seven, weight: 11)
  graph.add(.directed, from: zero,  to: two, weight: 4)
  
  let k = Kruskal(graph: graph)
  print(k.printMinimumSpanningTree())
}
