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
        
        if number % 3 == 0 && number % 5 == 0 {
            print("FizzBuzz")
        } else if number % 3 == 0 {
            print("fizz")
        } else if number % 5 == 0 {
            print("buzz")
        }
    }
}


func fizzbuzzTest() {
    fizzbuzz(numbers: 10)
}
