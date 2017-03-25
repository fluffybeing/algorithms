//
//  ReturnKTHLast.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// O(N)
func returnKthLast(head: Node<Int>, k: Int) -> Int? {
    
    // forward pointer with kth times ahead
    var vhead: Node<Int>? = head
    var kPointer: Node<Int>? = {
        for _ in 0..<k {
            vhead = vhead?.next
        }
        return vhead
    }()
    
    // it means index out of range
    if vhead == nil {
        return nil
    }
    
    vhead = head
    while kPointer != nil {
        vhead = vhead?.next
        kPointer = kPointer?.next
    }
    
    
    return vhead?.data
}


// TODO
// Recurson style
//    struct Holder {
//        static var counter = 0
//    }
//    // next node nil
//    if head.next == nil {
//        return nil
//    }
//    returnKthLast(head: head.next!, k: k)
//    if k == Holder.counter {
//        return head.data
//    }
//    return nil
