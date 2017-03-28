//
//  StackMin.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/27/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Custom stack node to keep min of substack
class StackNode: CustomStringConvertible {
    fileprivate var value: Int
    fileprivate var min: Int
    
    init(value: Int, min: Int) {
        self.value = value
        self.min = min
    }
    
    var description: String {
        return "Value: \(value) -- Min: \(min)"
    }
}

// Add a min func to exiting stack
struct MinStack {
    fileprivate var mainStack = Stack<StackNode>()
    fileprivate var auxiallryStack = Stack<StackNode>()
    
    fileprivate var min: Int?
    
    var isEmpty: Bool {
        return mainStack.isEmpty
    }
    
    mutating func push(_ element: Int) {
        if isEmpty {
            min = element
            
            let stackNode = StackNode(value: element, min: min!)
            mainStack.push(stackNode)
            return
        }

        if (element > min!) {
            // push the lower elments to auxiallary stack
            while mainStack.isEmpty != true {
                let topElement = mainStack.pop()
                
                if (topElement?.value)! < element  {
                    auxiallryStack.push(topElement!)
                } else {
                    mainStack.push(topElement!)
                    break
                }
            }
            mainStack.push(StackNode(value: element
                , min: min!))
            
        } else {
            // Take all element from auxiallary and push to main
            while auxiallryStack.isEmpty != true {
                mainStack.push(auxiallryStack.pop()!)
            }
            
            // Update the min and push to new stack
            min = element
            mainStack.push(StackNode(value: element, min: min!))
        }
    }
    
    mutating func pop() -> StackNode? {
        
        if isEmpty {
            return nil
        }
        
        return mainStack.pop()
        
    }
    
    func peek() -> StackNode? {
        return mainStack.peek()
    }
    
    func minElement() -> Int? {
        return min
    }
    
}

func minStackTest() {
    var stack = MinStack()
    
    // insert few elements
    stack.push(7)
    stack.push(2)
    stack.push(5)
    stack.push(9)
    stack.push(1)
    
    print(stack)
    assert(stack.minElement() == 1)
}


extension MinStack: CustomStringConvertible {
    public var description: String {
        
        return mainStack.description
    }
}

