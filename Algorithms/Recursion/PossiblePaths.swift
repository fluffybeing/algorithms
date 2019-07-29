//
//  PossiblePaths.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 27/7/19.
//  Copyright © 2019 Rahul Ranjan. All rights reserved.
//

import Foundation

func possiblePaths(size: Int) -> Int {

  return findPossiblePaths(m: 0, n: 0, final: size - 1)
}

func findPossiblePaths(m: Int, n: Int, final: Int) -> Int {
  if (m == final) && (n == final) {
    return 1
  }

  if (n > m) || (m > final) || (n > final) {
    return 0
  }

  return findPossiblePaths(m: m + 1, n: n, final: final) + findPossiblePaths(m: m, n: n+1, final: final)
}

func testPossiblePaths() {
  let result = possiblePaths(size: 4)
  assert(result == 5)
}

