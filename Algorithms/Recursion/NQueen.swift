//
//  NQueen.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 27/7/19.
//  Copyright © 2019 Rahul Ranjan. All rights reserved.
//

import Foundation

fileprivate let N = 4

func nQueen(queen: Int) {
  var board = [[Character]](repeating: [Character](repeating:  "-", count: N), count: N)
  nQueenBackTrack(mat: &board, queen: 0)
}

func nQueenBackTrack(mat: inout [[Character]], queen: Int) {
  if queen == N {
    for row in mat {
      print(row)
    }
    print()
    return
  }

  // Check if we can place the queen or not in the row
  for i in 0..<N {
    if isSafe(mat: mat, row: queen, col: i) {
      mat[queen][i] = "Q"
      nQueenBackTrack(mat: &mat, queen: queen + 1)

      // This is the step which makes backtracking possible
      // if the above recur was not sucessful, we will remove the queen
      mat[queen][i] = "-"
    }
  }
}

func isSafe(mat: [[Character]], row: Int, col: Int) -> Bool {

  // check for the upper diagonal
  var r = row
  var c = col
  while r < N  && c < N {
    if mat[r][c] == "Q" {
      return false
    }
    r += 1
    c += 1
  }
  
  // Lower diagonal
  var lRow = r
  var lCol = c
  while lRow < N && lCol < N {
    if mat[lRow][lCol] == "Q" {
      return false
    }
    lCol += 1
    lRow += 1
  }

  // check for the column
  for i in 0..<N {
    if mat[i][c] == "Q" {
      return false
    }
  }

  return true
}


func testNQueen() {
  nQueen(queen: 0)
}

