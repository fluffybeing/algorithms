//
//  HamiltonianPath.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/27/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


struct HamiltonianPath {
    
    let graph: AdjancencyListGraph<Int>
    var vertices: [Vertex<Int>]
    
    init(graph: AdjancencyListGraph<Int>) {
        self.graph = graph
        self.vertices = Array(graph.adjacencyDict.keys)
    }
    
    mutating func pathPermutations(firstVertexIndex: Int, lastVertexIndex: Int) {
        if firstVertexIndex == lastVertexIndex {
            
            if ishamiltonianPathExits() {
                print("Hamiltonain Path Exits: \(vertices)")
            }
            
        } else {
            for index in firstVertexIndex...lastVertexIndex {
                swapElementAtIndex(a: firstVertexIndex, b: index)
                pathPermutations(firstVertexIndex: firstVertexIndex + 1, lastVertexIndex: lastVertexIndex)
                swapElementAtIndex(a: firstVertexIndex, b: index)
            }
            
        }
    }
    
    mutating func swapElementAtIndex(a: Int, b: Int) {
        if a != b {
            swap(&vertices[a], &vertices[b])
        }
    }
    
    func ishamiltonianPathExits() -> Bool {
        
        // Iterate over the vertices and check
        // if there is a path between vertices or
        // not
        for index in 0..<vertices.count - 1 {
            var pathExist = false
            for edge in graph.adjacencyDict[vertices[index]]! {
                if edge.destination == vertices[index + 1] {
                    pathExist = true
                }
            }
            if !pathExist {
                return false
            }
        }
        return true
    }
}

func hamiltonianPathTest() {
    let graph = AdjancencyListGraph<Int>()
    
    let zero = graph.createVertex(data: 0)
    let one = graph.createVertex(data: 1)
    let two = graph.createVertex(data: 2)
    let three = graph.createVertex(data: 3)
    
    // graphs needs to be connected with the nodes
    graph.add(.directed, from: one, to: three, weight: 1)
    graph.add(.directed, from: two, to: three, weight: 1)
    graph.add(.directed, from: zero, to: one, weight: 3)
    graph.add(.directed, from: one, to: two, weight: 2)
 

    var hp = HamiltonianPath(graph: graph)
    hp.pathPermutations(firstVertexIndex: 0, lastVertexIndex: 3)
}

