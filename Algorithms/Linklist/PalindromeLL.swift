//
//  PalindromeLL.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// I am using Stack here
func isLinkListPalindrome(head: Node<Int>) -> Bool {
    var slow: Node<Int>? = head
    var fast: Node<Int>? = head
    
    // Get the mid
    while fast != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    
    // Add the half of element to
    // Stack for reverse
    var stack = reverse(head: slow!)
    
    // Get the head pointer
    slow = head
    while !stack.isEmpty {
        let topElement = stack.pop()
        
        if slow?.data != topElement?.data {
            return false
        }
    }
    return true
}

func reverse(head: Node<Int>) -> Stack<Node<Int>> {
    var node: Node<Int>? = head
    
    var stack = Stack<Node<Int>>()
    
    while node != nil {
        stack.push(node!)
        node = node?.next
        
    }
    return stack
}


func isLinkListPalindromeTest() {
    let ll = LinkList<Int>()
    
    ll.append(data: 1)
    ll.append(data: 1)
    ll.append(data: 1)
    ll.append(data: 2)
    ll.append(data: 1)
    ll.append(data: 1)
    ll.append(data: 1)
    
    assert(isLinkListPalindrome(head: ll.first!) == true)
}
