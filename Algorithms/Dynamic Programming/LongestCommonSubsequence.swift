//
//  LongestCommonSubsequence.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 25/7/19.
//  Copyright © 2019 Rahul Ranjan. All rights reserved.
//

import Foundation



extension String {

  func backTrack(_ mat: [[Int]]) -> String {
    var i = mat.count - 1
    var j = mat[0].count - 1
    var charInSequence = self.endIndex
    var lcs = String()

    while i >= 1 && j >= 1 {
      if mat[i][j] == mat[i][j-1] {
        j -= 1
      } else if mat[i][j] == mat[i-1][j] {
        i -= 1
        charInSequence = self.index(before: charInSequence)
      } else {
        i -= 1
        j -= 1
        charInSequence = self.index(before: charInSequence)
        lcs.append(self[charInSequence])
      }
    }
    return String(lcs.reversed())
  }

  // We will create an matrix of size [m+1][n+1]
  //     A D
  //   0 0 0
  // A 0
  // B 0
  func lcs(_ other: String) -> [[Int]] {

    // This table stores the info of already found the subsequence
    var mat = [[Int]](repeating: [Int](repeating: 0, count: other.count + 1),
                      count: self.count + 1)

    for (i, selfChar) in self.enumerated() {
      for (j, otherChar) in other.enumerated() {
        if selfChar == otherChar {
          mat[i+1][j+1] = mat[i][j] + 1
        } else {
          mat[i+1][j+1] = max(mat[i+1][j], mat[i][j+1])
        }
      }
    }
    return mat
  }
}
