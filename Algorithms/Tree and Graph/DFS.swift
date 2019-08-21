//
//  DFS.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func depthFirstSearch(graph: AdjancencyListGraph<String> , source: Vertex<String>) -> [Vertex<String>] {
    
  var stack = Stack<Vertex<String>>()
  // Created Visited Dictionary
  var visited = { () -> [Vertex<String> : Bool] in
    var visited: [Vertex<String>: Bool] = [:]
    graph.adjacencyDict.keys.forEach {
      visited[$0] = false
    }
    return visited
  }()

  var path: [Vertex<String>] = []

  // Add the first node and mark it visited
  stack.push(source)
  visited[source] = true
    
  while !stack.isEmpty {
    // remove the recently added element and add it to the path
    let topElement = stack.pop()
    path.append(topElement!)

    // get the neighbours
    guard let neigbhours = graph.edges(from: topElement!) else {
      return path
    }

    for neigbhour in neigbhours {
      let destinationVertex = neigbhour.destination
      if visited[destinationVertex] == false {
        stack.push(destinationVertex)
        visited[destinationVertex] = true
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
