import Cocoa

typealias GraphDict = [Int: [Int]]

enum State: Int {
  case white
  case gray
  case black
}

extension State: CustomStringConvertible {
  var description: String {
    switch self {
    case .black:
      return "black"
    case .white:
      return "white"
    case .gray:
      return "gray"
    }
  }
}

func buildOrder(_ packages: [Int: [Int]]) -> [Int] {
  var path = [Int]()
  
  for package in packages.keys {
    var visited = [Int: Bool]()
    visited[package] = true
    dfs(packages, src: package, path: &path, visited: &visited)
  }

  return path
}

// Something is wrong with this code
func dfs(_ g: GraphDict, src: Int, path: inout [Int], visited: inout [Int: Bool]) {
  
  if let neigbhours = g[src], !neigbhours.isEmpty {
    for n in neigbhours {
      dfs(g, src: n, path: &path, visited: &visited)
    }
  }
  
  if !path.contains(src) {
    path.append(src)
    visited[src] = false
  }

  return
}


// Second Try
func topologicalSort(_ g: [Int: [Int]]) -> [Int] {
  var path = [Int]()
  let whites = Array(repeating: State.white, count: g.keys.count)
  var states = Dictionary(uniqueKeysWithValues: zip(g.keys, whites))
  
  for node in g.keys {
    if states[node]! == .white {
      dfs2(g, src: node, path: &path, states: &states)
    }
  }
  
  return path.reversed()
}

func dfs2(_ g: GraphDict,
          src: Int,
          path: inout [Int],
          states: inout [Int: State]) {

  states[src] = .gray
  if let neighbours = g[src] {
    for neighbour in neighbours {
      print(states, neighbour, src)
      if states[neighbour]! == .gray { fatalError("There is a Cycle") }
      if states[neighbour]! == .black { continue }
      
      dfs2(g, src: neighbour, path: &path, states: &states)
    }
    states[src] = .black
    path.append(src)
  }
}


//1 -->  0
//^      ^
//|      |
//3 ---> 2
//^
//|
//4

//let result = buildOrder([0: [], 1: [0], 2: [4, 1], 3: [1, 2], 4: [1]])
//print(result)

let result2 = topologicalSort([0: [],
                               1: [0],
                               2: [1],
                               3: [2],
                               4: [3, 1]])
print(result2)
