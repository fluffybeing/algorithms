//
//  URLifyString.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/24/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func toURLifyString(input: String, orignalLength: Int, toReplace: Character = " ", replaceWith: String = "%20") -> String {
    
    var input = Array(input)
    let replaceWith = Array(replaceWith)
    
    let toReplaceCharacterCount: Int = {
        var count = 0
        for (index, character) in input.enumerated() {
            if character == toReplace && index < orignalLength {
                count += 1
            }
        }
        return count
    }()
    
    // Calculate the lenght of new string
    var index = (replaceWith.count - 1) * toReplaceCharacterCount + orignalLength
    
    if orignalLength < input.count {
        input[orignalLength] = Character("\0")
    }
    
    for i in (0..<orignalLength).reversed() {
        if input[i] == toReplace {
            input[index - 1] = replaceWith[0]
            input[index - 2] = replaceWith[1]
            input[index - 2] = replaceWith[2]
            
            index -= 3
        } else {
            input[index - 1] = input[i]
            index -= 1
        }
    }
    return String(input)
}


