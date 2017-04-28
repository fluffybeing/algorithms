//
//  TopologicalSorting.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/28/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

struct TopologicalSorting {
    let graph: AdjancencyListGraph<Int>
    var path = [Vertex<Int>]()
    var visited = Dictionary<Vertex<Int>, Int>()
    
    init(graph: AdjancencyListGraph<Int>) {
        self.graph = graph
        
        // using int for value because we want to
        // have multple value
        for vertex in graph.adjacencyDict.keys {
            visited[vertex] = 0
        }
    }
    
    
    mutating func DFS(source: Vertex<Int>) {
    
        if visited[source] == 1 {
            return
        }
        
        visited[source] = 1

        if let neighbours = graph.adjacencyDict[source] {
            for neighbour in neighbours {
                if visited[neighbour.destination] == 0 {
                    DFS(source: neighbour.destination)
                }
            }
        }
        path.append(source)
    }
    
    
    mutating func topologicalSorting() -> [Int] {
        for vertex in graph.adjacencyDict.keys {
            if visited[vertex] == 0 {
                DFS(source: vertex)
            }
        }
        
        return path.reversed().map {
            $0.data
        }
    }
}

func topologicalSortingTest() {
    let graph = AdjancencyListGraph<Int>()
    
    let one = graph.createVertex(data: 1)
    let two = graph.createVertex(data: 2)
    let three = graph.createVertex(data: 3)
    let four = graph.createVertex(data: 4)
    let five = graph.createVertex(data: 5)
    let six = graph.createVertex(data: 6)

    // graphs needs to be connected with all the nodes
    graph.add(.directed, from: one, to: two, weight: nil)
    graph.add(.directed, from: two, to: three, weight: nil)
    graph.add(.directed, from: three, to: six, weight: nil)
    graph.add(.directed, from: four, to: five, weight: nil)
    graph.add(.directed, from: four, to: one, weight: nil)
    graph.add(.directed, from: five, to: two, weight: nil)
    graph.add(.directed, from: five,  to: three, weight: nil)
    
    var tp = TopologicalSorting(graph: graph)
    assert(tp.topologicalSorting() == [4, 1, 5, 2, 3, 6])
    
}
