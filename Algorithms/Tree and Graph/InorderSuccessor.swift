//
//  Successor.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/2/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func findMin(node: BSTNode<Int>) -> BSTNode<Int> {
  var node = node

  while node.left != nil {
    node = node.left!
  }

  return node
}

//       5
//      /  \
//     3    7

// case 1: for root inorder successor would be min of right, so for 5 it is
// 7
// case 2: for 7 it is parent of 5. To find we need to go up and check if a node has left node
// case 3:

func inorderSuccessorUtil(root: BSTNode<Int>?, key: Int, parent: BSTNode<Int>?) -> BSTNode<Int>? {
    
  guard let root = root else { return nil }

  var successor: BSTNode<Int>?

  if root.data == key {
    if root.right != nil {
      successor = findMin(node: root.right!)
    }
  } else if key < root.data {
    successor = inorderSuccessorUtil(root: root.left, key: key, parent: root)
  } else {
    successor = inorderSuccessorUtil(root: root.right, key: key, parent: root)
  }

  return successor
}

func inorderSuccessor(root: BSTNode<Int>?, key: Int) -> Int {
  let successor = inorderSuccessorUtil(root: root, key: key, parent: nil)

  return successor?.data ?? -1
}

func inorderSuccessorTest() {
  let bst = BST<Int>()

  let keys = [15, 10, 20, 8, 12, 16, 25 ]
  for key in keys {
    bst.root = bst.insert(root: bst.root, key: BSTNode(data: key))
  }

  bst.inorder(node: bst.root)
  print(inorderSuccessor(root: bst.root, key: 25))
}
