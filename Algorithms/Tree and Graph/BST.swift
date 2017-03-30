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
    
    func insert(root: BSTNode<T>?, key: BSTNode<T>) {
        var root: BSTNode<T>? = root
        
        if root?.data == nil {
            root = key
            return
        } else if key.data <= root!.data {
            if root?.left != nil {
                self.insert(root: root?.left, key: key)
            } else {
                root?.left = key
            }
        } else {
            if root?.right != nil {
                self.insert(root: root?.right, key: key)
            } else {
                root?.right = key
            }
        }
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
    
    let root = BSTNode(data: 5)
    
    for i in 1..<4 {
        let node = BSTNode<Int>(data: i)
        bst.insert(root: root, key: node)
    }
    
    for i in 6..<10 {
        let node = BSTNode<Int>(data: i)
        bst.insert(root: root, key: node)
    }

    
    bst.inorder(node: root)
}


