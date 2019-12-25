import Cocoa

// TODO: Remove the gloabl variable
var weight = [Int: Int]()
func bellmanFordShortestPath(_ graph: [Int: [(Int, Int)]],  source: Int) {
  for node in graph.keys {
    weight[node] = Int.max
  }
  
  weight[source] = 0
  
  // n - 1 times is enough
  for vertex in graph.keys.dropLast() {
    
    // go through all the edges of the graph
    for v in graph.keys {
      for (node, distance) in graph[v]! {
        if weight[v]! == Int.max { continue }
        weight[node] = min(weight[node]!,
                           weight[v]! + distance)
      }
    }
  }
}

let g = [1: [(2, 2), (3, 3), (4, 7)],
         2: [(5, 5), (4, 3)],
         3: [(4, -2)],
         4: [(5, 2)],
         5: []]
bellmanFordShortestPath(g, source: 1)
print(weight)


// negative edge
// run one more time and see if the weight decreases

