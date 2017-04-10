//
//  Dijkstra.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/10/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// custom node to store vertex and weight
struct GraphNode: CustomStringConvertible {
    var vertex: Vertex<Int>
    var weight: Double
    
    init(vertex: Vertex<Int>, weight: Double) {
        self.vertex = vertex
        self.weight = weight
    }
    
    var description: String {
        return "\(weight)"
    }
}

struct Dijkstra {
    var pathWeight = Dictionary<Vertex<Int>, GraphNode>()
    var graph: AdjancencyListGraph<Int>
    var visited = Dictionary<Vertex<Int>, Bool>()
    let source: Vertex<Int>
    
    init(graph: AdjancencyListGraph<Int>, source: Vertex<Int>) {
        self.graph = graph
        self.source = source
    }
    
    mutating func initialiseToInfinity() {
        for vertex in graph.adjacencyDict.keys {
            // Make visited node false initially
            visited[vertex] = false
            
            if vertex == source {
                pathWeight[vertex] = GraphNode(vertex: vertex, weight: 0.0)
            } else {
                pathWeight[vertex] = GraphNode(vertex: vertex, weight: Double(UInt16.max))
            }
            
        }
    }
    
    mutating func findShortedPath() {
        
        // intialise infinity to all node
        self.initialiseToInfinity()
    
        // create a priority queue
        var pq = PriorityQueue<GraphNode>()
        pq.insert(element: GraphNode(vertex: source, weight: 0.0))
        
        // Now till priority queue doesn't get empty
        // kep checking for minimum weight graph node
        // like a greedy approcah
        while(!pq.isEmpty()) {
            let minWeightedNode = pq.extract()
            
            if let node = minWeightedNode {
                if (visited[node.vertex]!) {
                    continue
                }
                
                visited[node.vertex] = true
                
                for edge in graph.adjacencyDict[node.vertex]! {
                    
                    if let weight = calculateWeight(node: node, edge: edge) {
                        // Update the weight of the next node
                        let gn = GraphNode(vertex: edge.destination, weight: weight)
                        pathWeight[edge.destination] = gn
                        
                        pq.insert(element: gn)
                    }
                }
            }
        }
    }
    
    func calculateWeight(node: GraphNode, edge: Edge<Int>) -> Double? {
        
        // check the next node weight 
        let nextNodeWeight = pathWeight[edge.destination]
        let currentNodeWeight = node.weight + edge.weight!
        
        if currentNodeWeight < (nextNodeWeight?.weight)! {
            return currentNodeWeight
        }
        
        return nil
    }
    
    mutating func printNodeWithWeights() -> String {
        findShortedPath()
        return pathWeight.description
    }
}


func dijkstraTest() {
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
    graph.add(.directed, from: one, to: two, weight: 2)
    graph.add(.directed, from: zero, to: two, weight: 2)
    
    var dijkstra = Dijkstra(graph: graph, source: zero)
    print(dijkstra.printNodeWithWeights())
}


extension GraphNode: Comparable, Equatable {
    public static func <(lhs: GraphNode, rhs: GraphNode) -> Bool {
        return lhs.weight < rhs.weight
    }
    
    public static func ==(lhs: GraphNode, rhs: GraphNode) -> Bool {
        return (lhs.weight == rhs.weight) && (lhs.vertex == rhs.vertex)
    }
}
