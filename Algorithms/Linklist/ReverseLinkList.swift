//
//  ReverseLinkList.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/1/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation



// 1->2->3->nil # current state
// nil<-1->2->3 # next state
func reverseLinkList(linklist: LinkList<Int>) -> LinkList<Int> {
    var next: Node<Int>?
    var previous: Node<Int>?
    var current = linklist.first
    
    print("Current LinkList: \(linklist)")
    
    while(current != nil) {
        
        next = current?.next
        current?.next = previous
        
//        print("p: \(String(describing: previous?.data))," +
//            "n: \(String(describing: next?.data))," +
//            "c: \(String(describing: current?.data))")
        
        previous = current
        current = next
    }
    
    
    return LinkList<Int>(head: previous)
}


func reverseLinkListTest() {
    let ll = LinkList<Int>()
    
    ll.append(data: 1)
    ll.append(data: 2)
    ll.append(data: 3)
    
    let rll = reverseLinkList(linklist: ll)
    print(rll)
}
