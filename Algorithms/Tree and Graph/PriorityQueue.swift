//
//  File.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/6/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// Priority Queue Implementaton
struct PriorityQueue<T: Comparable> {
  var container = [T]()
    
  // check if queue is empty
  public func isEmpty() -> Bool {
    return container.isEmpty
  }
    
  public mutating func insert(element: T) {
    container.append(element)
    heapify()
  }

  // highest priority
  public func highestProrityElement() -> T {
    return container.first!
  }

  // Get the min element
  public mutating func extract() -> T? {
    if container.isEmpty {
      return nil
    }

    let element = container.removeFirst()
    // order the element
    heapify()
    return element
  }
    
  // Build the min heap
  private mutating func heapify() {
    for index in stride(from: (container.count)/2, to: -1, by: -1) {
      min_heapify(index: index)
    }
  }
    
  // we will use heap for the priority queue
  // use array as a tree
  private mutating func min_heapify(index: Int) {
    let left = 2 * index + 1
    let right = 2 * index + 2

    var smallest = index

    // check with left subtree node
    if (left < container.count && container[left] < container[index] ) {
      smallest = left
    }

    // check with the right subtree node
    if (right < container.count && container[right] < container[smallest]) {
      smallest = right

    }

    // Now check if smallest number is equal to root
    if smallest != index {
      container.swapAt(index, smallest)
      min_heapify(index: smallest)
    }
  }
}


func priorityQueueTest() {
  var pq = PriorityQueue<Int>()

  pq.insert(element: 10)
  pq.insert(element: 3)
  pq.insert(element: 2)
  pq.insert(element: 1)
  pq.insert(element: 12)
    
  assert(pq.highestProrityElement() == 1)
}
