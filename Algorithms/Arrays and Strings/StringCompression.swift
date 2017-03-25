//
//  StringCompression.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/25/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// aaabbccaa
// a3b2c2a2
func stringCompression(input: String) -> String {
    
    var input = Array(input.characters)
    var compressedString = [input[0]]
    var sameCharacterCounter = 1
    
    for c in 1..<input.count {
        if input[c] == input[c - 1] {
            sameCharacterCounter += 1
        } else {
            compressedString.append(Character("\(sameCharacterCounter)"))
            compressedString.append(input[c])
            sameCharacterCounter = 1
        }
    }
    compressedString.append(Character("\(sameCharacterCounter)"))
    
    // If compressed string length is same or greater then return the old
    
    return String(compressedString) <= String(input) ? String(input) : String(compressedString)
}

func stringCompressionTest() {
    assert(stringCompression(input: "aaabbcccaa") == "a3b2c3a2")
}

