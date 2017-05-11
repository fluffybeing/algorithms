//
//  AbstractSyntaxTree.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 5/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

class ASTNode {
    var operation: String?
    var value: Float?
    var leftChild: ASTNode?
    var rightChild: ASTNode?
    
    init(operation: String?, value: Float?, leftChild: ASTNode?, rightChild: ASTNode?) {
        self.operation = operation
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

func constructTree() -> ASTNode {
    //      '+'
    //     /   \
    //    '*'   5
    //   /   \
    //  25    6
    
    let twentyFive = ASTNode(operation: nil, value: 25, leftChild: nil, rightChild: nil)
    let six = ASTNode(operation: nil, value: 6, leftChild: nil, rightChild: nil)
    let multiply = ASTNode(operation: "*", value: nil, leftChild: twentyFive, rightChild: six)
    let five = ASTNode(operation: nil, value: 5, leftChild: nil, rightChild: nil)
    let plus = ASTNode(operation: "+", value: nil, leftChild: multiply, rightChild: five)
    
    return plus
}

func evaluateAST(node: ASTNode) -> Float {
    
    if let value = node.value {
        return value
    } else {
        guard let leftChild = node.leftChild, let rightChild = node.rightChild else {
            return 0
        }
        
        let left = evaluateAST(node: leftChild)
        let right = evaluateAST(node: rightChild)
        
        if let operation = node.operation {
            switch operation {
            case "+":
                return left + right
            case "*":
                return left * right
            default:
                return 0
            }
        }
    }
    return 0
}


func evalauteASTTest() {
    
    let node = constructTree()
    let result = evaluateAST(node: node)
    print(result)
}
