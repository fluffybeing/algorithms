import Cocoa

func matrixProduct(_ mat: [[Int]]) -> Int {
  guard !mat.isEmpty else { return 0 }

  let rowSize = mat.count
  let columnSize = mat[0].count

  var maxCache = Array(repeating: Array(repeating: 0, count: columnSize), count: rowSize)
  var minCache = Array(repeating: Array(repeating: 0, count: columnSize), count: rowSize)

  for i in 0..<rowSize {
    for j in 0..<columnSize {
      var minVal = Int.max
      var maxVal = Int.min

      if i == 0 && j == 0 {
        maxCache[i][j] = mat[i][j]
        minCache[i][j] = mat[i][j]
        continue
      }


      if i > 0 {
        let tempMax = max(mat[i][j] * maxCache[i - 1][j], mat[i][j] * minCache[i - 1][j])
        maxVal = max(maxVal, tempMax)
        let tempMin = min(mat[i][j] * maxCache[i - 1][j], mat[i][j] * minCache[i - 1][j])
        minVal = min(minVal, tempMin)
      }

      if j > 0 {
        let tempMax = max(mat[i][j] * maxCache[i][j - 1], mat[i][j] * minCache[i][j - 1])
        maxVal = max(maxVal, tempMax)
        let tempMin = min(mat[i][j] * maxCache[i][j - 1], mat[i][j] * minCache[i][j - 1])
        minVal = min(minVal, tempMin)
      }

      maxCache[i][j] = maxVal
      minCache[i][j] = minVal

      print(maxCache)
      print(minCache)
      print("--------")
    }
  }

  return maxCache[rowSize - 1][columnSize - 1]
}

// Be careful about the boundary conditions
func matrixProductPositive(_ mat: [[Int]]) -> Int {
  guard !mat.isEmpty else {
    return 0
  }

  var row = 0
  var column = 0
  var maxProduct = mat[row][column]

  while row < mat.count-1 || column < mat[0].count-1 {
    var down = Int.min
    var right = Int.min

    if row < mat.count-1 {
      down = maxProduct * mat[row + 1][column]
    }

    if column < mat[0].count-1 {
      right = maxProduct * mat[row][column + 1]
    }

    right >= down ? (column += 1) : (row += 1)
    maxProduct = max(right, down)
  }

  return maxProduct
}


let m = [[-1, 2, 3], [4, 5, -6], [7, 8, 9]]
//let result = matrixProductPositive(m)
let result = matrixProduct(m)
print(result)

