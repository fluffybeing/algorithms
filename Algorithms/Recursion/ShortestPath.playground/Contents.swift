import Cocoa


func shortestPath(mat: [[Int]], src: (Int, Int), dest: (Int, Int)) {

}

func isSafe(mat: [[Int]], visited: [[Int]], x: Int, y: Int) -> Bool {
  guard x < mat.count,
    y < mat.first!.count,
    x >= 0,
    y >= 0 else { return false }

  if mat[x][y] == 0 || visited[x][y] == 1 {
    return false
  }

  return true
}

func shortestPathUtil(mat: [[Int]], visited: [[Int]], src: (Int, Int), dest: (Int, Int), dist: Int, min_dist: inout Int) {
  var visited = visited
  var min_dist = min_dist

  if src == dest {
    min_dist = min(dist, min_dist)
  }

  let (x, y) = src
  visited[x][y] = 1

  if isSafe(mat: mat, visited: visited, x: x + 1, y: y) {
    shortestPathUtil(mat: mat, visited: visited, src: (x + 1, y), dest: dest, dist: dist + 1, min_dist: &min_dist)
  }
}
