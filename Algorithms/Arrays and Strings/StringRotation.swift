//
//  File.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/25/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// Find the first matching charater and reverse the subsstring
// O(N)
func stringRotation(firstString: String, secondString: String) -> Bool {
    
  if firstString.count != secondString.count {
    return false
  } else {
    for indexF in firstString.indices {
      if firstString[indexF] == secondString.first! {
        // Separate string into two subsets
        let x = firstString[..<indexF]
        let y = firstString[indexF...]

        // append the subset in reverse
        let reverseString = y + x

        if reverseString == secondString {
          return true
        }
      }
    }
  }
    return false
}

func stringRotationTest() {
    assert(stringRotation(firstString: "Calculateta", secondString: "taCalculate") == true)
    assert(stringRotation(firstString: "waterbottle", secondString: "erbottlewat") == false)
}

// TODO
// Add the same string two times and check whether given string
// is available or not
