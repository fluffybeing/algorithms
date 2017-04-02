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
    
    if let r = root {
        
        if r.data == key {
            if r.right != nil {
                return rightSuccessor(node: r.right!)
            } else {
                return parent
            }
        }
        
        let left = inorderSuccessorUtil(root: r.left, key: key, parent: r)
        if let l = left {
            return l
        }
        return inorderSuccessorUtil(root: r.right, key: key, parent: parent)
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
    
    print(bst.inorder(node: bst.root))
    print(inorderSuccessor(root: bst.root, key: 4))
}
