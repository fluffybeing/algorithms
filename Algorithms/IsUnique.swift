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
    
    for character in input.characters {
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
    for i in input.characters {
        // Swift doesn't allow int accessor over string type
        var count = 0
        for j in input.characters {
            if i == j {
                count += 1
            }
        }
        if count > 1 {
            return false
        }
    }
    return true
}

func isUniqueWithLoopTest() {
    assert(isUniqueWithLoop(input: "Hello") == false)
    assert(isUniqueWithLoop(input: "Rahul") == true)
    assert(isUniqueWithLoop(input: "") == true)
}


