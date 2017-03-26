//
//  SumList.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func sumLists(firstHead: Node<Int>, secondHead: Node<Int>) -> LinkList<Int> {
    
    var firstHead: Node<Int>? = firstHead
    var secondHead: Node<Int>? = secondHead
    
    let sumResult = LinkList<Int>()
    
    var sum: Int
    var carry: Int = 0
    
    while firstHead != nil || secondHead != nil {
        
        // Carry forward
        let first = firstHead?.data ?? 0
        let second = secondHead?.data ?? 0
        
        sum = first + second
        sum = sum >= 10 ? sum/10 : sum
        sumResult.append(data: sum + carry)
        carry = (first + second) >= 10 ? 1: 0
        
        firstHead = firstHead?.next
        secondHead = secondHead?.next
    }
    return sumResult
}
