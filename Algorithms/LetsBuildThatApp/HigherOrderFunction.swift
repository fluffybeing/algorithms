//
//  HigherOrderFunction.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func higherOrderFunctionExample() {
    let numbers = [1, 2, 3, 4, 5, 6, 7, 3, 3]

    // Filter
    let filteredNumbers = numbers.filter({ $0 == 3 })
    print("Filtered:", filteredNumbers)
    // Transform
    let transformedNumbers = numbers.map({ $0 * 2 })
    print("Transform:", transformedNumbers)
    // Sum
    let sum = numbers.reduce(0, {sum, number in sum + number})
    print("Sum", sum)
}
