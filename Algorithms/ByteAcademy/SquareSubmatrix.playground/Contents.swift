import Cocoa

func squareSubmatrix(mat: [[Int]]) -> [[Int]] {
  guard !mat.isEmpty else { return [[]] }

  // copy the first row and column into the cache
  var cache = Array(repeating: Array(repeating: 0, count: mat[0].count), count: mat.count)
  cache[0] = mat[0]

  for row in 0..<mat.count {
    cache[row][0] = mat[row][0]
  }

  for row in 1..<mat.count {
    for column in 1..<mat[0].count {
      if mat[row][column] == 1 {
        cache[row][column] = min(cache[row-1][column],
                                 cache[row][column-1],
                                 cache[row-1][column-1]) + 1
      } else {
        cache[row][column] = 0
      }
    }
  }
  return cache
}

let mat = [[0,  1,  1,  0,  1],
           [1,  1,  0,  1,  0],
           [0,  1,  1,  1,  0],
           [1,  1,  1,  1,  0],
           [1,  1,  1,  1,  1],
           [0,  0,  0,  0,  0]]

let result = squareSubmatrix(mat: mat)
print(result)

