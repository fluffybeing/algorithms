//
//  Node.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/25/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

public class Node<T> {
    var data: T
    
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(data: T) {
        self.data = data
    }
}
