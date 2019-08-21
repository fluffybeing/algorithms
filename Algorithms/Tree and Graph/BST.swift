//
//  BST.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


class BSTNode<T: Comparable> {
  var data: T

  var left: BSTNode<T>?
  var right: BSTNode<T>?

  init(data: T) {
    self.data = data
  }

  init(data: T, left: BSTNode<T>, right: BSTNode<T>) {
    self.data = data
    self.left = left
    self.right = right
  }

}

class BST<T: Comparable> {
  var root: BSTNode<T>?

  // Improve this function to have no return type
  // This will be better
  @discardableResult
  func insert(root: BSTNode<T>?, key: BSTNode<T>) -> BSTNode<T> {
    if root == nil {
      return key
    } else if key.data <= root!.data {
      root?.left = insert(root: root?.left, key: key)
    } else {
      root?.right = insert(root: root?.right, key: key)
    }
    return root!
  }
    
  func inorder(node: BSTNode<T>?) {
    if let n = node {
      inorder(node: n.left)
      print(n.data)
      inorder(node: n.right)
    }
  }

  func preorder(node: BSTNode<T>?) {
    if let n = node {
      print(n.data)
      preorder(node: n.left)
      preorder(node: n.right)
    }
  }
    
  func postorder(node: BSTNode<T>?) {
    if let n = node {
      postorder(node: n.left)
      postorder(node: n.right)
      print(n.data)
    }
  }
}

func bstTest() {
  let bst = BST<Int>()

  // Add the root node
  bst.root = BSTNode(data: 7)

  for i in 1..<6 {
    let node = BSTNode<Int>(data: i)
    bst.insert(root: bst.root, key: node)
  }

  for i in 6..<10 {
    let node = BSTNode<Int>(data: i)
    bst.insert(root: bst.root, key: node)
  }

  bst.inorder(node: bst.root)
}


extension BSTNode: CustomStringConvertible {
  public var description: String {
    return "\(data)"
  }
}

