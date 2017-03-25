//
//  MatrixRotation.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/25/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Rotate a matrix by 90 degree
// O(MXN) + Space Complexity of addition matrix
func rotateMatrixNintyDegree(matrix: [[Int]]) -> [[Int]] {
    
    var rotatedMatix =  [[Int]](repeating: [Int](repeating: 0, count: matrix[0].count), count: matrix.count)
    
    let matrixRowSize = matrix[0].count - 1
    
    for i in 0..<matrix.count {
        for j in 0...matrixRowSize {
            
            // Set the value for rotated index
            rotatedMatix[j][matrixRowSize - i] = matrix[i][j]
        }
    }
    //
    // 1 2 3 1
    // 3 4 4 2
    return rotatedMatix
}

func rotateMatrixNintyDegreeTest() {
//    assert(rotateMatrixNintyDegree(matrix: [[1, 2], [3, 4]]) == [[3, 1], [4, 2]])
}
