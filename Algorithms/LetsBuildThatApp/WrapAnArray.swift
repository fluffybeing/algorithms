//
//  WrapAnArray.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func wrapAnArray(array: [Int], pivot: Int) -> [Int] {
    
    
    // array.prefix
    // array.suffix
    if let pivotIndex = array.firstIndex(of: pivot) {
        let before = array[0..<pivotIndex]
        let after = array[pivotIndex..<array.count]
    
        return Array(after + before)
    }
    return []
    
}

func wrapAnArrayTest() {
    let result = wrapAnArray(array: [1, 2, 3, 4, 5, 6], pivot: 5)
    print(result)
}
