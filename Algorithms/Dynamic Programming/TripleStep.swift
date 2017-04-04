//
//  TripleStep.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/4/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func tripleStep(n: Int) -> Int {
    
    // intialise a memo array
    var memo = [Int](repeating: -1, count: n + 1)
    
    let result = tripleStepUtil(n: n, memo: &memo)
    return result
}


func tripleStepUtil(n: Int, memo: inout [Int]) -> Int {
    // if step will less than 0
    // we count it as zero
    if n < 0 {
        return 0
    }
    if n == 0 {
        return 1
    } else if (memo[n] > -1) {
        return memo[n]
    } else {
        memo[n] = tripleStepUtil(n: n - 1, memo: &memo) + tripleStepUtil(n: n - 2, memo: &memo) + tripleStepUtil(n: n - 3, memo: &memo)
        return memo[n]
    }
}

func tripleStepTest() {
    assert(tripleStep(n: 3) == 4)
}
