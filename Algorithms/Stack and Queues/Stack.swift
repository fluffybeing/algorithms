//
//  Stack.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/27/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Stack Operations:
// push pop peek

public struct Stack<Element> {
    fileprivate var array: [Element] = []
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func push(_ element: Element) {
        array.append(element)
    }
    
    public mutating func pop() -> Element? {
        return array.popLast()
    }
    
    public func peek() -> Element? {
        return array.last
    }
}

func stackTest() {
    var stack = Stack<String>()
    
    // insert few elements
    stack.push("1")
    stack.push("2")
    stack.push("5")
    
    print(stack)
    
    // Pop few elements
    _ = stack.pop()
    _ = stack.pop()
    
    print(stack)
}


extension Stack: CustomStringConvertible {
    public var description: String {
        let topMessage = "---Stack---\n"
        let bottomMessage = "\n------------\n"
        
        let arrayInReverse = array.map {"\($0)"}.reversed().joined(separator: "\n")
        
        return topMessage + arrayInReverse + bottomMessage
    }
}
