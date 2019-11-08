import Cocoa

func buildOrder(_ packages: [Int: [Int]]) -> [Int] {
  var path = [Int]()
  for package in packages.keys {
    dfs(packages, src: package, path: &path)
    if !path.contains(package) { path.append(package) }
  }

  return path
}

func dfs(_ g: [Int: [Int]], src: Int, path: inout [Int]) {
  if let neigbhours = g[src], !neigbhours.isEmpty {
    for n in neigbhours {
      dfs(g, src: n, path: &path)
      if !path.contains(n) { path.append(n) }
    }
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

let result = buildOrder([0: [], 1: [0], 2: [4, 1], 3: [1, 2], 4: [0]])
print(result)
