//
//  Prims.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/6/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

struct Prims {
    var minimumSpanningTree = [(Vertex<Int>, Double)]()
    var graph: AdjancencyListGraph<Int>
    var visited = Dictionary<Vertex<Int>, Bool>()
    
    init(graph: AdjancencyListGraph<Int>) {
        self.graph = graph
        
        self.initialiseVisited()
    }
    
    mutating func initialiseVisited() {
        for vertex in graph.adjacencyDict.keys {
            visited[vertex] = false
        }
    }
    
    mutating func pruneForest(startVertex: Vertex<Int>) {
        
        // Start from any arbitary node
        visited[startVertex] = true
        var pq = PriorityQueue<Edge<Int>>()
        
        // Insert the edges emitting from the node
        for edge in graph.adjacencyDict[startVertex]! {
            pq.insert(element: edge)
        }
        
        minimumSpanningTree.append((startVertex, pq.highestProrityElement().weight!))
        
        
        while(!isAllNodeVisited()) {
            
            // get the top edge for pq
            // check whether the node is already visited
            // if not mark it visised and add its edges to pq
            if let leastWeightEdge = pq.extract() {
                if visited[leastWeightEdge.destination] == false {
                    visited[leastWeightEdge.destination] = true
                    
                    // Add the node and weight to
                    // mst
                    minimumSpanningTree.append((leastWeightEdge.destination, leastWeightEdge.weight!))
                
                    for edge in graph.adjacencyDict[leastWeightEdge.destination]! {
                        pq.insert(element: edge)
                    }
                }
            }
        }
    }
    
    func printMinimumSpanningTree() {
        var weightSum = 0.0
        var text = ""
        
        for (vertex, weight) in minimumSpanningTree {
            weightSum += weight
            text += "\(vertex.data) "
        }
        
        print(text)
        print("weight: \(weightSum)")
    }
    
    func isAllNodeVisited() -> Bool {
        for (_, value) in visited {
            if !value {
                return false
            }
        }
        return true
    }
}

extension Edge: Comparable {
    public static func <(lhs: Edge, rhs: Edge) -> Bool {
        if lhs.weight! < rhs.weight! {
            return true
        }
        return false
    }
}


func primsTest() {
    let graph = AdjancencyListGraph<Int>()
    
    let zero = graph.createVertex(data: 0)
    let one = graph.createVertex(data: 1)
    let two = graph.createVertex(data: 2)
    let three = graph.createVertex(data: 3)

    // graphs needs to be connected with all the nodes
    graph.add(.undirected, from: zero, to: one, weight: 3)
    graph.add(.undirected, from: one, to: two, weight: 9)
    graph.add(.undirected, from: two, to: three, weight: 5)
    graph.add(.undirected, from: zero,  to: two, weight: 4)

    var prim = Prims(graph: graph)
    prim.pruneForest(startVertex: two)
    prim.printMinimumSpanningTree()
}
