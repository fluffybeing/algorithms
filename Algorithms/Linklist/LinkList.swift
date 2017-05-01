//
//  LinkList.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/25/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// Idea of structuring the LinkList class is taken from Raywenderlich tutorial
// https://www.raywenderlich.com/144083/swift-algorithm-club-swift-linked-list-data-structure
    
public class LinkList<T> {
    fileprivate var head: Node<T>?
    private var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    convenience init(head: Node<T>?) {
        self.init()
        self.head = head
    }
    
    public func append(data: T) {
        
        let newNode = Node(data: data)
        
        // if tail node available; replace it with new
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        
        // recursive implementation
        func findNode(node: Node<T>?, index: Int) -> Node<T>? {
            if index == 0 {
                return node
            }
            
            return (findNode(node: node?.next, index: index - 1))
        }
        
        let result = findNode(node: head, index: index)
        return result
    }
    
    public func removeAll() {
        head = nil
        tail = nil
    }
    
    public func remove(node: Node<T>) -> T {
        let prev = node.previous
        let next = node.next
        
        // Three cases
        // 1. Remove Head: new head will be the next and new head prev will be old head prev
        // 2. Remove in between: node previous next will be the next and node next previous will previous
        // 3. Remove tail: tail will prev of node

        if let prev = prev {
            prev.next = next
        } else {
            head = next
        }
        
        next?.previous = prev
        
        if next == nil {
            tail = prev
        }
        
        node.next = nil
        node.previous = nil
        
        return node.data
    }
}
    
extension LinkList: CustomStringConvertible {
    
    public var description: String {
        var text = "["
        var node = head
        
        while node != nil {
            text += "\(node!.data)"
            node = node!.next
            if node != nil { text += "-> "}
        }
        
        return text + "]"
    }
}
