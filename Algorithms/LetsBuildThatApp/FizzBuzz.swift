//
//  FizzBuzz.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func fizzbuzz(numbers: Int) {
    for number in 1...numbers {
        let threeDivisor = number % 3 == 0
        let fiveDivisor = number % 5 == 0
        
        if threeDivisor && fiveDivisor {
            print("FizzBuzz")
        } else if threeDivisor {
            print("fizz")
        } else if fiveDivisor {
            print("buzz")
        } else {
            print(number)
        }
    }
}

func fizzbuzzTest() {
    fizzbuzz(numbers: 15)
}
