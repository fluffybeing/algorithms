//
//  Partition.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Create two link list
// O(N)
func partition(linkList: LinkList<Int>, pivot: Int) -> LinkList<Int> {
    var head = linkList.first
    let lessLinkList = LinkList<Int>()
    let greaterLinkList = LinkList<Int>()
    
    while head != nil {
        if (head?.data)! < pivot {
            lessLinkList.append(data: (head?.data)!)
        } else {
            greaterLinkList.append(data: (head?.data)!)
        }
        
        head = head?.next
    }
    
    lessLinkList.last?.next = greaterLinkList.first
    greaterLinkList.first?.previous = lessLinkList.last
    
    return lessLinkList
}
