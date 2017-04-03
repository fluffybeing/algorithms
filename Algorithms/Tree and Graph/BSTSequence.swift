//
//  BSTSequence.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/3/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func bstSequence(root: BSTNode<Int>?) -> [[BSTNode<Int>]] {
    var result = [[BSTNode<Int>]]()
 
    if let root = root {
        
        // Add root to the prefix
        var prefix = [BSTNode<Int>]()
        prefix.append(root)
        
        // Now find all the left and right subtree sequence
        // recursively
        let leftSeq = bstSequence(root: root.left)
        let rightSeq = bstSequence(root: root.right)
        
        // weave together
        for left in leftSeq {
            for right in rightSeq {
                var weaved = [[BSTNode<Int>]]()
                var left = left
                var right = right
                
                weaveLists(first: &left, second: &right, results: &weaved, prefix: &prefix)
                result.append(contentsOf: weaved)
            }
        }
        return result
    }
    result.append([BSTNode<Int>]())
    return result
}

func weaveLists(first: inout [BSTNode<Int>], second: inout [BSTNode<Int>], results: inout [[BSTNode<Int>]], prefix: inout [BSTNode<Int>]) {
    
    if first.count == 0 || second.count == 0 {
        var result = prefix
        result.append(contentsOf: first)
        result.append(contentsOf: second)
        
        results.append(result)
        return
    }
    
    let headFirst = first.removeFirst()
    prefix.append(headFirst)
    weaveLists(first: &first, second: &second, results: &results, prefix: &prefix)
    prefix.removeLast()
    first.insert(headFirst, at: 0)
    
    let headSecond = second.removeFirst()
    prefix.append(headSecond)
    weaveLists(first: &first, second: &second, results: &results, prefix: &prefix)
    prefix.removeLast()
    second.insert(headSecond, at: 0)
    
}

func bstSequenceTest() {
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
    print(bstSequence(root: bst.root))
}
