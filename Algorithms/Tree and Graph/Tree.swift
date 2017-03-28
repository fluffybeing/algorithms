//
//  Tree.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/28/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// Tree implementation is based on the node
// as all other functionality are dependent on the requirement
// and adding them here is not a good idea
public class TreeNode<T> {
    var value: T
    var children: [TreeNode] = []
    weak var parent: TreeNode?
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: TreeNode) {
        children.append(child)
        child.parent = self
    }
}


func treeNodeTest() {
    
    let rootNode = TreeNode(value: "root")
    
    let firstChildNode = TreeNode(value: "firstChild")
    let secondChildNode = TreeNode(value: "SecondChild")
    
    rootNode.add(child: firstChildNode)
    rootNode.add(child: secondChildNode)
    
    print(rootNode)
}


extension TreeNode: CustomStringConvertible {
    public var description: String {
        var text = "\(value)"
        
        if !children.isEmpty {
            text += " {" + children.map {$0.description}.joined(separator: ", ") + "} "
        }
        
        return text
    }
}

extension TreeNode where T: Equatable {
    func search(value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        
        for child in children {
            if let node = child.search(value: value) {
                return node
            }
        }
        return nil
    }
}
