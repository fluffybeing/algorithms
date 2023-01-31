//
//  OneAway.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/24/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Implement a program to determine the number of edits (insert, remove or replace)
// required is less than one 
// 0(String Length)

func oneAway(firstString: String, secondString: String) -> Bool {
    
    let firstString = Array(firstString)
    let secondString = Array(secondString)
    
    let firstStringLength = firstString.count
    let secondStringLength = secondString.count
    
    let loopLength = min(firstStringLength, secondStringLength)

    var changeRequired = 0
    
    // if string size difference is greater than one
    // no need to proceed further
    if abs(firstStringLength - secondStringLength) > 1 {
        return false
        
    } else if abs(firstStringLength - secondStringLength) == 1 {
        
        var counterFirst = 0
        var counterSecond = 0
        
        // if length difference is 1, when charater not same increase
        // bigger length counter
        for _ in 0..<loopLength {
            if firstString[counterFirst] != secondString[counterSecond] {
                if firstStringLength > secondStringLength {
                    counterFirst += 1
                    changeRequired += 1
                } else {
                    counterFirst += 1
                    counterSecond += 1
                }
            }
            if changeRequired > 1 {
                return false
            }
        }
    } else {
        // if same length, just check
        for index in 0..<loopLength {
            if firstString[index] != secondString[index] {
                changeRequired += 1
            }
        }
        if changeRequired > 1 {
            return false
        }
    }
    return true
}

func oneAwayTest() {
    assert(oneAway(firstString: "Hello", secondString: "Hella") == true)
    assert(oneAway(firstString: "Hello", secondString: "MHello") == true)
    assert(oneAway(firstString: "Hello", secondString: "MZHello") == false)
    assert(oneAway(firstString: "Hello", secondString: "HezQo") == false)
}
