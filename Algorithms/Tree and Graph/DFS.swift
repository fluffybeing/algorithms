//
//  DFS.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


func depthFirstSearch(graph: AdjancencyListGraph<String> , source: Vertex<String>) -> [Vertex<String>]? {
    
    var stack = Stack<Vertex<String>>()
    var visited:[Vertex<String>: Bool] = [:]
    var path: [Vertex<String>]? = []
    
    stack.push(source)
    visited[source] = true
    path?.append(source)
    
    while !stack.isEmpty {
        let topElement = stack.pop()
        
        guard let neigbhours = graph.edges(from: topElement!) else {
            return nil
        }
        
        for neigbhour in neigbhours {
            let destinationVertex = neigbhour.destination
            
            // Add vertex destination as not visited
            if visited[destinationVertex] == nil {
                visited[destinationVertex] = false
            }
            if visited[destinationVertex] == false {
                stack.push(destinationVertex)
                visited[destinationVertex] = true
                path?.append(destinationVertex)
            }
        }
    }
    return path
}

func depthFirstSearchTest() {
    
    let (graph, source) = initialiseAdjacencyListGraph()
    let path = depthFirstSearch(graph: graph, source: source)
    
    print(path!)
}
