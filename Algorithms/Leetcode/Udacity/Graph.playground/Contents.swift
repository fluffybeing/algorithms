import UIKit

// https://www.youtube.com/watch?v=tWVWeAqZ0WU&list=PLE3MQtyuGX8Ji9U813xyPX0o74MMW29hm

//let graph = [
//  "a": ["b", "c"],
//  "b": ["d"],
//  "c": ["e"],
//  "d": ["f"],
//  "e": [],
//  "f": []
//]


func depthFirstPrint(_ start: String, _ g: [String: [String]]) {
  var stack = [start]
  
  while(!stack.isEmpty) {
    let current = stack.popLast()!
    print(current)
    if let neighbour = g[current] {
      for n in neighbour {
        stack.append(n)
      }
    }
  }
  
  return
}

//depthFirstPrint("a", graph)


func depthFirstPrintRecurse(_ start: String, _ g: [String: [String]]) {
  print(start)
  
  if let neighbour = g[start] {
    for n in neighbour {
      depthFirstPrint(n, g)
    }
  }

  return
}

//depthFirstPrintRecurse("a", graph)

func hasPath(_ src: String, _ dst: String, _ g: [String: [String]]) -> Bool {
  if src == dst { return true }
  
  if let edges = g[src] {
    for e in edges {
      if hasPath(e, dst, g) { return true }
    }
  }
  
  return false
}


//let graph = [
//  "f": ["g", "i"],
//  "g": ["h"],
//  "h": [],
//  "i": ["g", "k"],
//  "j": ["i"],
//  "k": []
//]
//
//let result = hasPath("f", "k", graph)


func buildGraph(_ edges: [[String]]) -> [String: [String]] {
  var g = [String: [String]]()
  
  for e in edges {
    precondition(e.count == 2)
    let a = e[0]
    let b = e[1]
    g[a, default: []].append(b)
    g[b, default: []].append(a)
  }
  
  return g
}

func hasPath(_ src: String, _ dst: String, _ graph: [String: [String]], visited: inout Set<String>) -> Bool {
  if src == dst { return true }
  if visited.contains(src) { return false }
  
  visited.insert(src)
  
  if let neighbours = graph[src] {
    for n in neighbours {
      if hasPath(n, dst, graph, visited: &visited) {
        return true
      }
    }
  }
  return false
}

func undirectedGraph(_ src: String, dst: String, edges: [[String]]) -> Bool {
  let g = buildGraph(edges)
  var visited = Set<String>()

  return hasPath(src, dst, g, visited: &visited)
}

let edges = [
  ["i", "j"],
  ["k", "i"],
  ["m", "k"],
  ["k", "l"],
  ["o", "n"]
]

//undirectedGraph("j", dst: "m", edges: edges)


// Connected components
