//
//  CommonAncestor.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/2/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func commonAncestor(root: BSTNode<Int>?, firstNode: Int, secondNode: Int) -> BSTNode<Int>? {
    
    if let root = root {
        
        if root.data == firstNode || root.data == secondNode {
            return root
        }
        
        let left = commonAncestor(root: root.left, firstNode: firstNode, secondNode: secondNode)
        let right = commonAncestor(root: root.right, firstNode: firstNode, secondNode: secondNode)
        
        if left != nil && right != nil {
            return root
        }
        
        if left != nil {
            return left
        } else if right != nil {
            return right
        }
        
        return nil
    }
    
    return nil
}

func commonAncestorTest() {
    let bst = BST<Int>()
    
    // Add the root node
    bst.root = BSTNode(data: 3)
    _ = bst.insert(root: bst.root, key: BSTNode(data: 5))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 2))
    _ = bst.insert(root: bst.root?.left, key: BSTNode(data: 4))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 1))
    
    assert(commonAncestor(root: bst.root, firstNode: 4, secondNode: 5)!.data == 3)
}
