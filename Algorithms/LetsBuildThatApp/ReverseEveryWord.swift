//
//  ReverseEveryWord.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func reverseEveryWord(sentence: String) -> String {
    var wordArray = sentence.components(separatedBy: " ")
    
    // Todo user stride to avoid modulus
    for (index, word) in wordArray.enumerated() {
        if index % 2 == 1 {
            let reversedWord = String(word.reversed())
            wordArray[index] = reversedWord
        }
    }
    
    return wordArray.joined(separator: " ")
}

func reverseEveryWordTest() {
    let result = reverseEveryWord(sentence: "Hello World! this is a test for my algorithm")
    print(result)
}
