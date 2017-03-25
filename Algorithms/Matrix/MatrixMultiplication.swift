import Foundation

// 2 1  *  1  =  2*1+1*1 = 3
// 3 2     1     3*1+2*1   5
//
// 2X2     2X1   2X1
// implement general matrix multiplication function
func matrixMultiplication(a:[[Int]], b:[[Int]])-> [[Int]] {

    let bColumnLength = b[0].count

    var c = [[Int]](repeating:[Int](repeating:0, count: bColumnLength), count:a.count)

    // check if the dimesion of column of the first matrix equals to rows of
    // second matrix
    if a[0].count != b.count {
        fatalError("The matrix cannot be multiplied")
    }

    // Iterate through row of a
    for i in 0..<a.count {
        // Iterate through column of b
        for j in 0..<bColumnLength {
            // Iterate through row of b
            for k in 0..<b.count {
                c[i][j] += a[i][k] * b[k][j]
            }
        }
    }
    return c
}

// Test some cases
func matrixMultiplicationTest() {
    _ = matrixMultiplication(a: [[2, 1], [3, 2]], b: [[1], [1]])
    _ = matrixMultiplication(a: [[1, 2, 3], [4, 3, 5], [6, 7, 8]], b: [[4, 2], [1, 5], [6, -2]])
}
