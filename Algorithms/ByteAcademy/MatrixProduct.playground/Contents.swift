import Cocoa

func matrixProduct(_ mat: [[Int]]) -> Int {
  return 0
}

func matrixProductUtil(_ mat: [[Int]], visit: inout [[Int]],
                       x: Int, y: Int, product: inout Int) {
  guard !mat.isEmpty else { return }

  if x == mat.count && y == mat[0].count {
    return
  }

  let down = mat[x + 1][y]
  product = max(product, product * down)
  visit[x + 1][y] = 1
  matrixProductUtil(mat, visit: &visit, x: x + 1, y: y, product: &product)

  let right = mat[x][y + 1]
  product = max(product, product * right)
  visit[x][y + 1] = 1
  matrixProductUtil(mat, visit: &visit, x: x, y: y + 1, product: &product)
}




