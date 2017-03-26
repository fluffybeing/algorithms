//
//  DetectIntersection.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func detectIntersection(headOne: Node<Int>, headTwo: Node<Int>) -> Bool {
    var headOne: Node<Int>? = headOne
    var headTwo: Node<Int>? = headTwo
    
    while headOne != nil || headTwo != nil {
        if headOne?.data == headTwo?.data {
            while headOne != nil {
                if headOne?.data == headTwo?.data {
                    headOne = headOne?.next
                    headTwo = headTwo?.next
                } else {
                    return false
                }
            }
            return true
        }
        headOne = headOne?.next
        headTwo = headTwo?.next
    }
    return false
}


func detectIntersectionTest() {
    
    let f = LinkList<Int>()
    let s = LinkList<Int>()
    
    f.append(data: 1)
    f.append(data: 2)
    f.append(data: 3)
    f.append(data: 4)
    f.append(data: 5)
    f.append(data: 7)
    f.append(data: 6)
    
    s.append(data: 10)
    s.append(data: 12)
    s.append(data: 13)
    s.append(data: 15)
    s.append(data: 10)
    s.append(data: 9)
    s.append(data: 8)
    
    // [1-> 2-> 3-> 4-> 5-> 7-> 6]
    // [10-> 12-> 13-> 15-> 10-> 9-> 8]
    assert(detectIntersection(headOne: f.first!, headTwo: s.first!) == false)
}
