//
//  File.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/25/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func stringRotation(firstString: String, secondString: String) -> Bool {
    
    if firstString.characters.count != secondString.characters.count {
        return false
    } else {
        for indexF in firstString.characters.indices {
            if firstString[indexF] == secondString.characters.first! {
                // Separate string into two subsets
                let x = firstString.substring(to: indexF)
                let y = firstString.substring(from: indexF)
                
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
