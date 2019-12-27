import Cocoa

// simply use bfs to find the shorted path
typealias Graph = [Int: [Int]]


func shortestPath(from src: Int, to dest: Int, in graph: Graph) {
  var path = [Int]()
  var visited = Dictionary(uniqueKeysWithValues: graph.keys.map({($0, false)}))
  
  func bfs(_ node: Int) -> Bool {
    visited[node] = true
    
    var queue = [node]
    while !queue.isEmpty {
      let currentNode = queue.popLast()!
      path.append(currentNode)
      
      if let neighbours = graph[currentNode] {
        for neighbour in neighbours {
          if neighbour == dest {
            // append it if you want to display it
            path.append(neighbour)
            return true
          }
          if !visited[neighbour]! {
            queue.append(neighbour)
          }
        }
      }
    }
    return false
  }

  if bfs(src) {
    print(path)
  } else {
    print("Path doesn't exists")
  }
}


let graph = [1: [2, 3], 2: [5], 5: [4], 4: [3, 1], 3: []]

shortestPath(from: 2, to: 3, in: graph)
