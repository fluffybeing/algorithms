//
//  PathBetweenVertex.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

func pathBetweenVertex(graph: AdjancencyListGraph<String> , source: Vertex<String>, destination: Vertex<String>) -> [Vertex<String>]? {
    
    var stack = Stack<Vertex<String>>()
    var visited = { () -> [Vertex<String> : Bool] in
        var visited: [Vertex<String>: Bool] = [:]
        
        for (key, _) in graph.adjacencyDict {
            visited[key] = false
        }
        return visited
    }()
    
    var path: [Vertex<String>]? = []
    
    stack.push(source)
    visited[source] = true
    
    while !stack.isEmpty {
        let topElement = stack.pop()
        path?.append(topElement!)
        
        if topElement! == destination {
            return path
        }
        
        
        guard let neigbhours = graph.edges(from: topElement!) else {
            return path
        }
        
        for neigbhour in neigbhours {
            let destinationVertex = neigbhour.destination
            if visited[destinationVertex] == false {
                stack.push(destinationVertex)
                visited[destinationVertex] = true
            }
        }
    }
    return nil
}

func pathBetweenVertexTest() {
    let graph = AdjancencyListGraph<String>()
    
    let a = graph.createVertex(data: "a")
    let b = graph.createVertex(data: "b")
    let c = graph.createVertex(data: "c")
    let d = graph.createVertex(data: "d")
    
    //  a ---> b ----> c <-
    //  | <--- ^         \_|
    //  v      |
    //  d -----
    graph.add(.undirected, from: a, to: b, weight: 5)
    graph.add(.directed, from: b, to: c, weight: 6)
    graph.add(.directed, from: c, to: c, weight: 3)
    graph.add(.directed, from: a, to: d, weight: 3)
    graph.add(.directed, from: d, to: b, weight: 3)
    
    let path = pathBetweenVertex(graph: graph, source: a, destination: d)
    assert(path! == [a, d])
}

// TODO Print shortest path
// TODO implement using recursion
