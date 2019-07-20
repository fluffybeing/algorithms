//
//  MergeSort.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 9/7/19.
//  Copyright © 2019 Rahul Ranjan. All rights reserved.
//

import Foundation

func mergeSort(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }

  let middleIndex = array.count / 2

  let left = mergeSort(Array(array[0..<middleIndex]))
  let right = mergeSort(Array(array[middleIndex..<array.count]))
  let result = mergeSortUtil(left: left, right: right, array: array)

  return result
}

func mergeSortUtil(left: [Int], right: [Int], array: [Int]) -> [Int] {
  var array = array
  var i = 0, j = 0, k = 0

  while (i < left.count) && (j < right.count) {
    if left[i] < right[j] {
      array[k] = left[i]
      i += 1
    } else {
      array[k] = right[j]
      j += 1
    }
    k += 1
  }
  // Left items on either of the array
  while i < left.count {
    array[k] = left[i]
    i += 1
    k += 1
  }

  while j < right.count {
    array[k] = right[j]
    j += 1
    k += 1
  }

  return array
}


func mergeSortTest() {
  let result = mergeSort([7, 5, 6, 6, 12, 0])
  print(result)

  assert(result == [0, 5, 6, 6, 7, 12])
}
