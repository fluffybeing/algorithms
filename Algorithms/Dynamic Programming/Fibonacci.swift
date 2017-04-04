//
//  Fibonacci.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/4/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Basic

func fibonacci(n: Int) -> Int? {
    
    // If number less than 0
    if n < 0 { return nil }
    
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    return fibonacci(n: n - 1)! + fibonacci(n: n - 2)!
}

// Top Down
func tdFibonacci(n: Int, memo: inout [Int]) -> Int {
    
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    // Maintain an array which stores already calculated value
    if memo[n] > -1 {
        return memo[n]
    } else {
        memo[n] = tdFibonacci(n: n - 1, memo: &memo) + tdFibonacci(n: n - 2, memo: &memo)
        return memo[n]
    }
}


// Bottom Up
func buFibonacci(n: Int) -> Int {
    if n == 0 { return 0 }
    if n == 1 { return 1 }
    
    var a = 0
    var b = 1
    
    for _ in 2...n {
        let c = a + b
        a = b
        b = c
    }
    return a + b
    
}

func fibonacciTest() {
    assert(fibonacci(n: 5)! == 5)
}
