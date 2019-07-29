//
//  QuickSort.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 25/7/19.
//  Copyright © 2019 Rahul Ranjan. All rights reserved.
//

import Foundation


func quickSort(_ array: [Int]) -> [Int] {
  guard array.count > 0 else { return array }

  let mid = array.count / 2
  let pivot = array[mid]
  let left = quickSort(array.filter { $0 < pivot })
  let right = quickSort(array.filter { $0 > pivot })

  return  left + [pivot] + right
}

func quickSortTest() {
  let result = quickSort([9, 6, 7])
  assert(result == [6, 7, 9])
}
