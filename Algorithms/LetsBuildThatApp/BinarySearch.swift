//
//  BinarySearch.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func binarySearch(array: [Int], elementToSearch: Int) -> Bool {
    
    return binarySeachUtil(low: 0, high: array.count - 1,
                           element: elementToSearch, array: array)
    
}

func binarySeachUtil(low: Int, high: Int, element: Int, array: [Int]) -> Bool  {
    
    if low > high {
        return false
    }
    
    let mid = (low + high) / 2
    let midValue = array[mid]
    
    // I need to return everytime because unless the last call to 
    // recursion will get printed
    if midValue == element {
        return true
    } else if element < midValue {
        return binarySeachUtil(low: low, high: mid - 1, element: element, array: array)
    } else {
        return binarySeachUtil(low: mid + 1, high: high, element: element, array: array)
    }
}

func binarySearchTest() {
    let result = binarySearch(array: [1, 2, 3, 4], elementToSearch: 3)
    print(result)
}
