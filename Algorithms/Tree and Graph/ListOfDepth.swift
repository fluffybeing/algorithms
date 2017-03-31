//
//  ListOfDepth.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/31/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func heightOfTree(root: BSTNode<Int>?) -> Int {
    
    if let n = root {
        
        if n.left == nil && n.right == nil {
            return 1
        }
        
        let leftSubtreeHeight = heightOfTree(root: n.left)
        let rightSubtreeHeight = heightOfTree(root: n.right)
        
        return max(leftSubtreeHeight, rightSubtreeHeight) + 1
    }
    return 0
}

func leverOrder(root: BSTNode<Int>) {
    
    let height = heightOfTree(root: root)
    
    for level in 1...height {
        let list = LinkList<Int>()
        listOfDepth(root: root, level: level, list: list)
        print(list.description)
    }
}

// Given a binary tree, design a algorithm which creates linklist of each level
func listOfDepth(root: BSTNode<Int>?, level: Int, list: LinkList<Int>) {
    
    if let n = root {
        if level == 1 {
            list.append(data: n.data)
        } else if level > 1 {
            listOfDepth(root: n.left, level: level - 1, list: list)
            listOfDepth(root: n.right, level: level - 1, list: list)
        }
    }
    return
}


func levelOrderTest() {
    let bst = BST<Int>()
    
    // Add the root node
    bst.root = BSTNode(data: 3)
    _ = bst.insert(root: bst.root, key: BSTNode(data: 5))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 2))
    _ = bst.insert(root: bst.root?.left, key: BSTNode(data: 4))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 1))
    
    leverOrder(root: bst.root!)
}
