//
//  MinimalTree.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/30/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


struct BSTRoot {
    static var bstRoot: BSTNode<Int>?
}

// Break the array in half and make the middle element as root node
func minimalTree(startIndex: Int, endIndex: Int, array: [Int]) -> BSTNode<Int>? {
    
    if startIndex > endIndex {
        return nil
    }
    
    let midIndex = Int((startIndex + endIndex ) / 2 )
    let midElement = array[midIndex]
    let root = BSTNode(data: midElement)

    root.left = minimalTree(startIndex: startIndex, endIndex: midIndex - 1, array: array)
    root.right = minimalTree(startIndex: midIndex + 1, endIndex: endIndex, array: array)

    return root
}

func minimalTreeTest() {
    
    let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let root = minimalTree(startIndex: 0, endIndex: array.count - 1, array: array)
    
    let bst = BST<Int>()
    bst.inorder(node: root)
}
