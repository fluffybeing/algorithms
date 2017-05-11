//
//  FizzBuzz.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func fizzbuzz(numbers: Int) {
    for number in 0..<numbers {
        let threeDivisor = number % 3
        let fiveDivisor = number % 5
        
        if threeDivisor == 0 && fiveDivisor == 0 {
            print("FizzBuzz")
        } else if threeDivisor == 0 {
            print("fizz")
        } else if fiveDivisor == 0 {
            print("buzz")
        }
    }
}

func fizzbuzzTest() {
    fizzbuzz(numbers: 10)
}
