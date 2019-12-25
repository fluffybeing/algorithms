//
//  ConnectedComponent.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/5/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Find all the connect component in a graph
//    a -> b -> c
//              |     m -> n
//              |
//              V
//              d
// (a, b, c, d) are one connected component and (m, n) is another

func dfs(_ graph: [Int: [Int]], source: Int,
         path: inout [Int],
         visited: inout [Bool]) {
  if visited[source] {
    return
  }
  
  visited[source] = true
  path.append(source)
  for node in graph[source]! {
    dfs(graph, source: node, path: &path, visited: &visited)
  }
}

func connectedComponents(_ graph: [Int: [Int]]) {
  var components = [[Int]]()

  var visited = Array(repeating: false, count: graph.keys.max()! + 1)
  for node in graph.keys {
    var path = [Int]()
    dfs(graph, source: node, path: &path, visited: &visited)
    components.append(path)
  }
  
  print(components.filter({ !$0.isEmpty} ))
}

let g = [1: [2], 2: [3], 3: [1], 4: [5], 5: [4]]

