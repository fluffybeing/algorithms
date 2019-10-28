import Cocoa

func matrixSearch(mat: [[Int]], num: Int) -> Bool {
  guard !mat.isEmpty else {
    return false
  }

  var row = 0
  var column = mat[0].count - 1

  while row < mat.count && column >= 0 {
    if mat[row][column] == num {
      return true
    } else if mat[row][column] < num {
      row += 1
    } else {
      column -= 1
    }
  }

  return false
}

let mat = [[1, 3], [5, 6]]
let result = matrixSearch(mat: mat, num: 1)
print(result)
