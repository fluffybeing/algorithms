import Cocoa

import Foundation

class Solution {
  let xMove = [1, -1, 0, 0, -1, 1, -1, 1]
  let yMove = [0, 0, 1, -1, -1, 1, 1, -1]

  public init() {}

  func isSafe(x: Int, y: Int, _ aSize: Int, _ bSize: Int) -> Bool {
    if x >= 0 && y >= 0 && x < aSize && y < bSize {
      return true
    }
    return false
  }

  func coverPoints(_ A: inout [Int], _ B: inout [Int]) -> Int {
    var nodes = Array(zip(A, B))
    var visited = [Int](repeating: 0, count: nodes.count)

    // start
    var queue = [nodes[0]]
    visited[0] = 1
    var count = 0

    while !queue.isEmpty {
      count += 1
      let (x, y) = queue.removeLast()

      for i in 0..<8 {
        // take all the 8 steps and check if it can be
        // reached
        let nX = x + xMove[i]
        let nY = y + yMove[i]
        if isSafe(x: nX, y: nY, A.count, B.count) {
          if let index = nodes.firstIndex(where: { $0.0 == nX && $0.1 == nY }),
            visited[index] == 0 {
            visited[index] = 1
            queue.append((nX, nY))
          }
        }
      }

      if visited.filter({ $0 == 0 }).isEmpty {
        return count
      }
    }

    return count
  }
}

let s = Solution()
var A = [0, 1, 1]
var B = [0, 1, 2]

let result = s.coverPoints(&A, &B)
print(result)
