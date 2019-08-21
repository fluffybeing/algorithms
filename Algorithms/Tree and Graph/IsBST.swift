//
//  IsBST.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/31/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func isBST(root: BSTNode<Int>?, leftMin: Int, rightMax: Int) -> Bool {
  guard let n = root  else { return true }

  if leftMin > n.data || rightMax < n.data {
    return false
  }

  return isBST(root: n.left, leftMin: leftMin, rightMax: n.data) && isBST(root: n.right, leftMin: n.data, rightMax: rightMax)
}

func isBSTTest() {
  let bst = BST<Int>()

  // Add the root node
  bst.root = BSTNode(data: 3)
  bst.insert(root: bst.root, key: BSTNode(data: 5))
  bst.insert(root: bst.root, key: BSTNode(data: 2))
  bst.insert(root: bst.root?.left, key: BSTNode(data: 4))
  bst.insert(root: bst.root, key: BSTNode(data: 1))

  bst.inorder(node: bst.root)
  let result = isBST(root: bst.root, leftMin: Int(INT8_MIN), rightMax: Int(INT_MAX))
  assert(result == false)
}
