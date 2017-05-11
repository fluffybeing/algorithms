//
//  BinaryTreeSearch.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


class BinaryNode {
    let value: Int
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(value: Int, leftChild: BinaryNode?, rightChild: BinaryNode?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// Search a particular value inside this tree
func searchInBinaryTree(node: BinaryNode?, searchValue: Int) -> Bool {
    
    if let node = node {
        if node.value == searchValue {
            return true
        } else {
            return searchInBinaryTree(node: node.leftChild,
                                  searchValue: searchValue) ||
                    searchInBinaryTree(node: node.rightChild,
                                       searchValue: searchValue)
        }
    }
    
    return false
}

func searchInBinaryTreeTest() {
    let root = BinaryNode(value: 4, leftChild: nil, rightChild: nil)
    root.leftChild = BinaryNode(value: 5, leftChild: nil, rightChild: nil)
    root.rightChild = BinaryNode(value: 6, leftChild: nil, rightChild: nil)
    
    let result = searchInBinaryTree(node: root, searchValue: 6)
    print(result)
}
