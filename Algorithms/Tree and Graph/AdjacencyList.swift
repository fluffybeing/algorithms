//
//  AdjacencyList.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/29/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// We could have the list using dictionary but it would have constrained us to use certain types and so we need to create generic type for our dict and compliance with the type safety we made our key and value hashable
// The below Adjacency list can store any type of key and value pairs.
open class AdjancencyListGraph<T: Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
}

extension AdjancencyListGraph: Graphable {
    public func createVertex(data: T) -> Vertex<T> {
        
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    
    func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        
        adjacencyDict[source]?.append(edge)
    }
    
    func addUnDirectedEdge(vertices: (Vertex<T>, Vertex<T>), weight: Double?) {
        let (src, dest) = vertices
        addDirectedEdge(from: src, to: dest, weight: weight)
        addDirectedEdge(from: dest, to: src, weight: weight)
    }
    
    public func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUnDirectedEdge(vertices: (source, destination), weight: weight)
        }
    }
    
    public func weight(fom source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        
        return nil
    }
    
    func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (_, edge) in edges.enumerated() {
                edgeString.append("\(edge.destination)")
            }
        result.append("\(vertex) --> [\(edgeString)] \n")
        }
        return result
    }
}

func adjacencyListGraphTest() {
    let graph = AdjancencyListGraph<String>()
    
    let a = graph.createVertex(data: "a")
    let b = graph.createVertex(data: "b")
    let c = graph.createVertex(data: "c")
    
    graph.add(.undirected, from: a, to: b, weight: 5)
    graph.add(.undirected, from: b, to: c, weight: 6)
    graph.add(.undirected, from: a, to: c, weight: 3)
    
    print(graph.description)
}
