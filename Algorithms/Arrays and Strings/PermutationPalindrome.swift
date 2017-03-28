//
//  PermutationPalindrome.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/24/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Given a String, find whether this string can have a
// palindrome or not
// O(N)
func isPermutationPalindrome(input: String) -> Bool {
    
    var hashMap = [Character: Int]()
    
    for character in input.characters {
        if hashMap[character] != nil {
            hashMap[character]! += 1
        } else {
            hashMap[character] = 1
        }
    }
    
    var flag = false
    for(_, value) in hashMap {
        if flag && value % 2 == 1 {
            return false
        }
        
        if value % 2 == 1 {
            flag = true
        }
    }
    return true
}

// TODO
// Find all permutations of the string 
