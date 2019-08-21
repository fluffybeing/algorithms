//
//  CommonAncestor.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/2/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func commonAncestor(root: BSTNode<Int>?, firstNode: Int, secondNode: Int) -> BSTNode<Int>? {
  guard let root = root else { return nil }

  // if root is either of node then return it
  if root.data == firstNode || root.data == secondNode {
    return root
  }

  // find in left or right subtree then
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
