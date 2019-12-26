//
//  Graphable.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/28/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// Protocol Structure taken from
// https://www.raywenderlich.com/152046/swift-algorithm-club-graphs-adjacency-list
protocol Graphable {
  associatedtype Element: Hashable
  
  var description: CustomStringConvertible { get }

  func createVertex(data: Element) -> Vertex<Element>
  func add(_ type: EdgeType,
           from source: Vertex<Element>,
           to destination: Vertex<Element>,
           weight: Double?)
  func weight(fom source: Vertex<Element>,
              to destination: Vertex<Element>) -> Double?
  func edges(from source: Vertex<Element>) -> [Edge<Element>]?
}

