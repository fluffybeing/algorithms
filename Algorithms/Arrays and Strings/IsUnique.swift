//
//  IsUnique.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/24/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Implement an algorithm to determine if a string has all unique characters

// Approach 1
// 0(N)
func isUniqueWithHashMap(input: String) -> Bool {
    
    var hashMap = [Character: Int]()
    
    for character in input {
        if hashMap[character] != nil {
            return false
        } else {
            hashMap[character] = 1
        }
    }
    return true
}


func isUniqueWithHashMapTest() {
    assert(isUniqueWithHashMap(input: "Rahul"))
    assert(isUniqueWithHashMap(input: "Hello") == false)
    assert(isUniqueWithHashMap(input: ""))
}

// Approach 2
// Without additional DataStructure
// O(N^2)
func isUniqueWithLoop(input: String) -> Bool {
  for (i, char) in input.enumerated() {
    var j = i + 1
    while j < input.count {
      if Array(input)[j...].contains(char) {
        return false
      }
      j += 1
    }
  }
  return true
}

func isUniqueWithLoopTest() {
  assert(isUniqueWithLoop(input: "Hello") == false)
  assert(isUniqueWithLoop(input: "Rahul") == true)
  assert(isUniqueWithLoop(input: "") == true)
}

