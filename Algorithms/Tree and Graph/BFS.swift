//
//  BFS.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func breadthFirstSearch(graph: AdjancencyListGraph<String> , source: Vertex<String>) -> [Vertex<String>]? {
    
  var queue = Queue<Vertex<String>>()
  var visited = { () -> [Vertex<String> : Bool] in
    var visited: [Vertex<String>: Bool] = [:]
    graph.adjacencyDict.keys.forEach {
      visited[$0] = false
    }
    return visited
  }()

  var path: [Vertex<String>] = []
  queue.enqueue(source)
  visited[source] = true

  while !queue.isEmpty {
    let topElement = queue.dequeue()
    path.append(topElement!)

    guard let neigbhours = graph.edges(from: topElement!) else {
      return path
    }

    for neigbhour in neigbhours {
      let destinationVertex = neigbhour.destination

      if visited[destinationVertex] == false {
        queue.enqueue(destinationVertex)
        visited[destinationVertex] = true
      }
    }
  }
  return path
}

func breadthFirstSearchTest() {
  let (graph, source) = initialiseAdjacencyListGraph()
  let path = breadthFirstSearch(graph: graph, source: source)

  print(path!)
}

