//
//  Factorial.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func factorial(number: UInt) -> UInt {
    
    if number == 0 {
        return 1
    }
    
    return number * factorial(number: number - 1)
}

func factorialTest() {
    let result = factorial(number: 5)
    assert(result == 120)
}
