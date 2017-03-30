//
//  BST.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


public class BSTNode<T: Comparable> {
    var data: T
    
    var left: BSTNode<T>?
    var right: BSTNode<T>?
    
    init(data: T) {
        self.data = data
    }
    
}


public class BST<T: Comparable> {
    var root: BSTNode<T>?
    
    func insert(root: BSTNode<T>?, key: BSTNode<T>) -> BSTNode<T> {
        var root: BSTNode<T>? = root
        
        if root?.data == nil {
            root = key
        } else if key.data <= root!.data {
            root?.left = self.insert(root: root?.left, key: key)
        } else {
            root?.right = self.insert(root: root?.right, key: key)
        }
        return root!
    }
    
    func inorder(node: BSTNode<T>?) {
        let node: BSTNode<T>? = node
        
        if node == nil {
            return
        }
        inorder(node: node?.left)
        print(node!.data)
        inorder(node: node?.right)
    }
    
    func preorder(node: BSTNode<T>) {
        let node: BSTNode<T>? = node
        
        if node == nil {
            return
        }
        
        print(node!.data)
        preorder(node: (node?.left)!)
        preorder(node: (node?.right)!)
    }
    
    func postorder(node: BSTNode<T>) {
        let node: BSTNode<T>? = node
        
        if node == nil {
            return
        }
    
        postorder(node: (node?.left)!)
        postorder(node: (node?.right)!)
        print(node!.data)
    }
}

func bstTest() {
    let bst = BST<Int>()
    
    // Add the root node
    bst.root = BSTNode(data: 7)
    
    for i in 1..<6 {
        let node = BSTNode<Int>(data: i)
        _ = bst.insert(root: bst.root, key: node)
    }
    
    for i in 6..<10 {
        let node = BSTNode<Int>(data: i)
        _ = bst.insert(root: bst.root, key: node)
    }
    
    bst.inorder(node: bst.root)
}


