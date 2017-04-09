//
//  BellmanFord.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/9/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// Bellmon ford can handle negative edges
// Why? because it loops over each node and
// update the node weight
struct BellmonFord {
    var pathWeight = Dictionary<Vertex<Int>, Double>()
    var graph: AdjancencyListGraph<Int>
    
    let source: Vertex<Int>
    
    init(graph: AdjancencyListGraph<Int>, source: Vertex<Int>) {
        self.graph = graph
        self.source = source
    }
    
    mutating func initialiseToInfinity() {
        for vertex in graph.adjacencyDict.keys {
            if vertex == source {
                pathWeight[source] = 0.0
            } else {
                pathWeight[vertex] = Double(UInt16.max)
            }
            
        }
    }
    
    mutating func findShortedPath() {
        
        // intialise infinity
        self.initialiseToInfinity()
        
        // Now we will loop for N-1 times
        // This is because a graph will have
        // max N-1 edges without cycle
        for _ in 0..<graph.adjacencyDict.count - 1 {
            
            // check connecting edges and update the weight
            for vertex in graph.adjacencyDict.keys {
                
                // if current weight is infinity no need to
                // update edges
                if pathWeight[vertex]! != Double(UInt16.max) {
                
                    if let edges = graph.adjacencyDict[vertex] {
                        for edge in edges {
                            if let weight = calculateWeight(edge: edge) {
                                pathWeight[edge.destination] = weight
                            }
                        }
                    }
                }
            }
        }
    }
    
    func calculateWeight(edge: Edge<Int>) -> Double? {
        
        let currentWeight = pathWeight[edge.destination]!
        let newWeight = pathWeight[edge.source]! + edge.weight!
        
        if newWeight < currentWeight {
            return newWeight
        }
        
        return nil
    }
    
    mutating func printNodeWithWeights() -> String {
        findShortedPath()
        return pathWeight.description
    }
}


func bellmonFordTest() {
    let graph = AdjancencyListGraph<Int>()
    
    let zero = graph.createVertex(data: 0)
    let one = graph.createVertex(data: 1)
    let two = graph.createVertex(data: 2)
    let three = graph.createVertex(data: 3)
    let four = graph.createVertex(data: 4)
    
    // graphs needs to be connected with all the nodes
    graph.add(.directed, from: one, to: three, weight: 1)
    graph.add(.directed, from: three, to: four, weight: 1)
    graph.add(.directed, from: two, to: four, weight: 1)
    graph.add(.directed, from: zero, to: one, weight: 3)
    graph.add(.directed, from: one, to: two, weight: -2)
    graph.add(.directed, from: zero, to: two, weight: 2)
    
    
    var bellmonFord = BellmonFord(graph: graph, source: zero)
    print(bellmonFord.printNodeWithWeights())

}
