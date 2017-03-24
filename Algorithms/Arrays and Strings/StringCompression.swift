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
    return String(compressedString)
}

func stringCompressionTest() {
    stringCompression(input: "aaabbcccaa")
}

