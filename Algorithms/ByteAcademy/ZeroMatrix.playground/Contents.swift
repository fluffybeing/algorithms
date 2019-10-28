import Cocoa

func zeroMatrix(mat: [[Int]]) -> [[Int]] {
  var mat = mat

  guard !mat.isEmpty, !mat[0].isEmpty else {
    return mat
  }

  let rowZero = mat[0].contains(1)
  let columnZero = mat.contains(where: { $0[0] == 1 } )



  for row in 1..<mat.count {
    for column in 1..<mat[0].count {
      if mat[row][column] == 1 {
        mat[0][column] = 1
        mat[row][0] = 1
      }
    }
  }


  // make the whole row true
  for row in 0..<mat.count {
    if mat[row][0] == 1 {
      for column in 1..<mat[0].count {
        mat[row][column] = 1
      }
    }
  }

  // make whole column true
  for column in 0..<mat[0].count {
    if mat[0][column] == 1 {
      for row in 1..<mat.count {
        mat[row][column] = 1
      }
    }
  }

  if rowZero == true {
    for row in 0..<mat.count {
      mat[row][0] = 1
    }
  }

  if columnZero == true {
    for column in 0..<mat[0].count {
      mat[0][column] = 1
    }
  }

  return mat
}


let mat = [[0, 0], [0, 1]]

let result = zeroMatrix(mat: mat)
print(result)
