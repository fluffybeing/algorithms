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
func connectedComponents(g: [String: [String]]) -> [[String]] {
  var components = [[String]]()
  var visited = Set<String>()
  
  for node in g.keys {
    print(visited)
    let c = component(node, g, &visited)
    components.append(c)
  }
  
  return components
}

func component(_ start: String, _ graph: [String: [String]], _ visited: inout Set<String>) -> [String] {
  if visited.contains(start) { return [] }
  
  visited.insert(start)
  var path = [start]
  if let neighbours = graph[start] {
    for n in neighbours {
      path += component(n, graph, &visited)
    }
  }
  
  return path
}
     
let graph = [
  "a": ["b"],
  "b": ["c", "a"],
  "c": ["f", "b"],
  "d": [],
  "e": ["g"],
  "g": ["h", "e"]
]

//connectedComponents(g: graph)


// Shortest path
// Cyclic

func shortestPath(_ edges: [[String]], _ nodeA: String, nodeB: String) -> Int {
  
  let graph = buildGraph(edges)
  var queue = [(nodeA, 0)]
  var visited = Set<String>()
  visited.insert(nodeA)
  
  while(!queue.isEmpty) {
    let (node, distance) = queue.first!
    
    if node == nodeB {
      return distance
    }
    
    if let neighbours = graph[node] {
      for n in neighbours {
        if !visited.contains(n) {
          visited.insert(n)
          queue.append((n, distance + 1))
        }
      }
    }
  }
  
  return -1
}

// Island count

let grid = [
  ["W", "L", "W", "W", "W"],
  ["W", "L", "W", "W", "W"],
  ["W", "W", "W", "L", "W"],
  ["W", "W", "L", "L", "W"],
  ["L", "W", "W", "L", "L"],
  ["L", "L", "W", "W", "W"],
]

func islandCount(_ grid: [[String]]) -> Int {
  guard !grid.isEmpty else { return 0 }
  
  var visited = Set<String>()
  var count = 0
  for row in 0..<grid.count {
    for col in 0..<grid[0].count {
      if depthFirstSearch(grid, row, col, visited: &visited) {
        count += 1
      }
    }
  }
  
  return count
}

func depthFirstSearch(_ grid: [[String]], _ row: Int, _ col: Int, visited: inout Set<String>) -> Bool {
  let rowInBounds = (0 <= row) && (row < grid.count)
  let colInBounds = (0 <= col) && (col < grid[0].count)
  
  if (!rowInBounds || !colInBounds) {
    return false
  }
  
  if grid[row][col] == "W" {
    return false
  }
  
  let pos = "\(row),\(col)"
  if visited.contains(pos) { return false }
  visited.insert(pos)
  
  // For direction
  depthFirstSearch(grid, row - 1, col, visited: &visited)
  depthFirstSearch(grid, row + 1, col, visited: &visited)
  depthFirstSearch(grid, row, col - 1, visited: &visited)
  depthFirstSearch(grid, row, col + 1, visited: &visited)

  return true
}

let result = islandCount(grid)
print(result)
