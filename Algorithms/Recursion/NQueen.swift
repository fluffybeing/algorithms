//
//  NQueen.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 27/7/19.
//  Copyright © 2019 Rahul Ranjan. All rights reserved.
//

import Foundation

fileprivate let N = 8

func nQueen(queen: Int) {
  var board = [[Character]](repeating: [Character](repeating:  "-", count: N), count: N)

  nQueenBackTrack(mat: &board, queen: 0)
  print(board)
}

func nQueenBackTrack(mat: inout [[Character]], queen: Int) {

  if queen == N {
    return
  }

  // Check if we can place the queen or not in the row
  for i in 0..<N {
    if isSafe(mat: mat, r: queen, c: i) {
      mat[queen][i] = "Q"
      nQueenBackTrack(mat: &mat, queen: queen+1)

      // This is the step which makes backtracking possible
      // if the above recur was not sucessful, we will remove the queen
      mat[queen][i] = "-"
    }
  }
}

func isSafe(mat: [[Character]], r: Int, c: Int) -> Bool {

  // check for the diagonal
  let rRow = stride(from: r, to: 0, by: -1)
  let rCol = stride(from: c, to: N - 1, by: 1)
  for (i , j) in zip(rRow, rCol) {
    if mat[i][j] == "Q" {
      return false
    }
  }

  let lRow = stride(from: r, to: N - 1, by: 1)
  let lCol = stride(from: c, to: 0, by: -1)
  for (i , j) in zip(lRow, lCol) {
    if mat[i][j] == "Q" {
      return false
    }
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
  nQueen(queen: 8)
}

