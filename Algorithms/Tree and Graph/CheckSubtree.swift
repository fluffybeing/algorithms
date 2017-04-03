//
//  CheckSubtree.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/3/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func checkSubtree(firstTree: BSTNode<Int>?, secondTree: BSTNode<Int>?) -> Bool {
    
    if let f = firstTree, let s = secondTree {
        if f.data == s.data && match(firstRoot: f, secondRoot: s) {
            return true
        }
        
        _ = checkSubtree(firstTree: f.left, secondTree: s)
        _ = checkSubtree(firstTree: f.right, secondTree: s)
        
        return false
    }
    return false
}

func match(firstRoot: BSTNode<Int>?, secondRoot: BSTNode<Int>?) -> Bool {
    
    if let f = firstRoot, let s = secondRoot {
        
        if f.data != s.data {
            return false
        }
        
        _ = match(firstRoot: f.left, secondRoot: s.left)
        _ = match(firstRoot: f.right, secondRoot: s.right)
        
        return true
    }
    return false
}

func matchTest() {
    let bst = BST<Int>()
    
    // Add the root node
    bst.root = BSTNode(data: 3)
    _ = bst.insert(root: bst.root, key: BSTNode(data: 5))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 2))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 4))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 1))
    
    //         3
    //        / \
    //       2   5
    //      /    /
    //     1    4
    print(match(firstRoot: bst.root, secondRoot: bst.root))
}

func checkSubtreeTest() {
    let bst = BST<Int>()
    
    // Add the root node
    bst.root = BSTNode(data: 3)
    _ = bst.insert(root: bst.root, key: BSTNode(data: 5))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 2))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 4))
    _ = bst.insert(root: bst.root, key: BSTNode(data: 1))
    
    //         3
    //        / \
    //       2   5
    //      /    /
    //     1    4
    assert(checkSubtree(firstTree: bst.root, secondTree: bst.root?.left) == true)
}
