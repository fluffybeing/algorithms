import Cocoa

func buildOrder(_ packages: [Int: [Int]]) -> [Int] {
  var path = [Int]()
  
  for package in packages.keys {
    var visited = [Int: Bool]()
    visited[package] = true
    dfs(packages, src: package, path: &path, visited: &visited)
  }

  return path
}

func dfs(_ g: [Int: [Int]], src: Int, path: inout [Int], visited: inout [Int: Bool]) {
  
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


//1 -->  0
//^      ^
//|      |
//3 ---> 2
//^
//|
//4

let result = buildOrder([0: [], 1: [0], 2: [4, 1], 3: [1, 2], 4: [1]])
print(result)
