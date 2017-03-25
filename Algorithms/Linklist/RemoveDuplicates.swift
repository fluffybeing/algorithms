//
//  FindDuplicates.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func removeDuplicates(linkList: LinkList<Int>) -> LinkList<Int> {
    var head = linkList.first
    
//    let size: Int = {
//        var count = 0
//        while head != nil {
//            count += 1
//        }
//        return count
//    }()
    
    while head != nil {
        var nextNode = head?.next
        while nextNode != nil {
            if nextNode?.data == head?.data {
                _ = linkList.remove(node: nextNode!)
            }
            nextNode = nextNode?.next
        }
        head = head?.next
    }
    return linkList
}
