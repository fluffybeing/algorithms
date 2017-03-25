//
//  DeleteMiddleNode.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// O(N)
func deleteMiddleNode(linkList: LinkList<Int>) -> LinkList<Int>? {
    
    if linkList.isEmpty {
        return nil
    }
    
    var fast: Node<Int>? = linkList.first
    var slow: Node<Int>? = linkList.first
    
    // Slow will get the middle node
    while fast != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    if let slow = slow {
        _ = linkList.remove(node: slow)
        return linkList
    }
    return nil
}
