//
//  LoopDetection.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// O(N)
func loopDetection(head: Node<Int>) -> (Bool, Int?) {
    
    var fast: Node<Int>? = head
    var slow: Node<Int>? = head
    
    var result: (cycle: Bool, node: Int?) = (false, nil)
    
    let isCycle: Bool = {
        while fast != nil {
            fast = fast?.next?.next
            slow = slow?.next
            
            if fast?.data == slow?.data {
                result.cycle = true
                return true
            }
        }
        return false
    }()
    
    // keep the fast pointer whether it is
    // but set the slow pointer to point head
    // m + k = (2p-q)n
    slow = head
    if isCycle == true {
        
        while slow?.data != fast?.data {
            slow = slow?.next
            fast = fast?.next
        }
        
    }
    result.node = (slow?.data)!
    return result
}

func loopDetectionTest() {
    let ll = LinkList<Int>()
    
    ll.append(data: 1)
    ll.append(data: 2)
    ll.append(data: 3)
    ll.append(data: 4)
    ll.append(data: 5)
    ll.append(data: 7)
    ll.append(data: 6)
    
    // Make loop at four
    ll.last?.next = ll.nodeAt(index: 4)
    
    let result = loopDetection(head: ll.first!)
    assert((result.0, result.1!) == (true, 5))
}
