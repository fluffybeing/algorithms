import Cocoa

// Min/Max Path

// Given a target find minimum (maximum) cost / path / sum to reach the target.
// Min cost to climb a stairs

func minCostClimbingStairs(_ cost: [Int]) -> Int {
  let n = cost.count
  var dp = Array(repeating: 0, count: n + 1)
  dp[0] = cost[0]
  dp[1] = cost[1]
  for i in 2...n {
    dp[i] = min(dp[i-1], dp[i-2]) + (i == n ? 0 : cost[i]);
  }
  
  print(dp)
  return dp[n];
}

func minPathSum(_ grid: [[Int]]) -> Int {
  let rowCount = grid.count
  let colCount = grid[0].count
  var dp = grid
  for i in 1..<rowCount {
    for j in 1..<colCount {
      dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
    }
  }
  
  print(dp)
  return dp[rowCount - 1][colCount - 1]
}


let grid = [
  [1,3,1],
  [1,5,1],
  [4,2,1]
]

let result = minPathSum(grid)
print(result)
