//
//  Successor.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/2/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation



func rightSuccessor(node: BSTNode<Int>) -> BSTNode<Int> {
    
    var node = node
    
    while node.left != nil {
        node = node.left!
    }
    
    return node
}


func inorderSuccessorUtil(root: BSTNode<Int>?, key: Int, parent: BSTNode<Int>?) -> BSTNode<Int>? {
    
    if let root = root {
        
        if root.data == key {
            if root.right != nil {
                return rightSuccessor(node: root.right!)
            } else {
                return parent
            }
        }
    
        let left = inorderSuccessorUtil(root: root.left, key: key, parent: root)
        if let l = left {
            return l
        }
        
        let right = inorderSuccessorUtil(root: root.right, key: key, parent: parent)
        if let r = right {
            return r
        }
    }
   return nil
}

func inorderSuccessor(root: BSTNode<Int>?, key: Int) -> Int {
    let successor = inorderSuccessorUtil(root: root, key: key, parent: nil)
    
    return successor!.data
}


func inorderSuccessorTest() {
    
    let bst = BST<Int>()
    
    // Add the root node
    bst.root = BSTNode(data: 3)
    _ = bst.insert(root: bst.root, key: BSTNode(data: 5))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 2))
    _ = bst.insert(root: bst.root?.left, key: BSTNode(data: 4))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 1))
    
    print(inorderSuccessor(root: bst.root, key: 4))
}
