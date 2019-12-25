//
//  DFS.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

typealias VisitedDictionary = [Vertex<String>: Bool]

func depthFirstSearch(graph: AdjancencyListGraph<String>, source: Vertex<String>) -> [Vertex<String>] {
    
  var stack = Stack<Vertex<String>>()

  var visited: VisitedDictionary = {
    var v = VisitedDictionary()
    graph.adjacencyDict.keys.forEach {
      v[$0] = false
    }
    return v
  }()

  var path: [Vertex<String>] = []

  // Add the first node and mark it visited
  stack.push(source)
  visited[source] = true
    
  while !stack.isEmpty {
    let topElement = stack.pop()!
    path.append(topElement)
    visited[topElement] = true
    
    // get the neighbours
    if let neigbhours = graph.neighbours(for: topElement) {
      for neigbhour in neigbhours {
        if visited[neigbhour] == false {
          stack.push(neigbhour)
        }
      }
    }
  }
  return path
}

func depthFirstSearchTest() {
  let (graph, source) = initialiseAdjacencyListGraph()
  let path = depthFirstSearch(graph: graph, source: source)

  print(path)
}
