//
//  Queue.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/27/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


public struct Queue<Element> {
    fileprivate var array: [Element] = []
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element: Element) {
        array.append(element)
    }
    
    public mutating func dequeue() -> Element? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    public func peek() -> Element? {
        return array.first
    }
    
}

func queueTest() {
    var queue = Queue<String>()
    
    // insert few elements
    queue.enqueue("1")
    queue.enqueue("2")
    queue.enqueue("5")
    
    print(queue)
    
    // Pop few elements
    _ = queue.dequeue()
    _ = queue.dequeue()
    
    
    print(queue)
}


extension Queue: CustomStringConvertible {
    public var description: String {
        let topMessage = "---Queue---\n"
        let bottomMessage = "\n------------\n"
        
        let arrayInReverse = array.map {"\($0)"}.joined(separator: "\n")
        
        return topMessage + arrayInReverse + bottomMessage
    }
}
