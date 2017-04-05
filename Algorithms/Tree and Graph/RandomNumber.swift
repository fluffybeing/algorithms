//
//  RandomNumber.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/4/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// AVL Tree
class RNode {
    var key: Int
    var size: Int
    
    var left: RNode?
    var right: RNode?
    
    init(key: Int, size: Int = 1) {
        self.key = key
        self.size = 1
    }
}

func find(node: RNode?, key: Int) -> RNode? {
    if let n = node {
        
        if n.key == key {
            return n
        }
        
        if key < n.key {
            return find(node: n.left, key: key)
        } else {
            return find(node: n.right, key: key)
        }
        
    }
    return nil
}

func insert(node: RNode?, key: Int) -> RNode {
    
    if let n = node {
        
        if n.key > key {
            n.left = insert(node: n.left, key: key)
            return rotateRight(node: n)
        } else {
            n.right = insert(node: n.right, key: key)
            return rotateLeft(node: n)
        }
    }
    
    return RNode(key: key)
}

// Calculaye the size for current node
func currentSize(node: RNode?) -> Int {
    if let n = node {
        return (n.left?.size ?? 0) + (n.right?.size ?? 0) + 1
    }
    return 0
}


// Rotate Right
func rotateRight(node: RNode) -> RNode {
    
    guard let q = node.left else {
        return node
    }
    
    node.left = q.right
    q.right = node
    q.size = node.size
    
    node.size = currentSize(node: node)
    
    return q
}


// Rotate left
func rotateLeft(node: RNode) -> RNode {
    
    guard let q = node.right else {
        return node
    }
    
    node.right = q.left
    q.left = node
    q.size = node.size
    
    node.size = currentSize(node: node)
    
    return q
}

