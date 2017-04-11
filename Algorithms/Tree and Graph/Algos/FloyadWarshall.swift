//
//  FloyadWarshall.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/11/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


struct FloydWarshall {
    var graph: [[Int]]
    
    init(graph: [[Int]]) {
        self.graph = graph
    }
    
    func initialise() {
        
    }
    
    func floydWarshellPair() -> [[Int]] {
        var dist = self.graph
        
        for k in 0..<dist.count {
            for i in 0..<dist.count {
                for j in 0..<dist.count {
                    if dist[i][j] > dist[i][k] + dist[k][j] {
                        dist[i][j] = dist[i][k] + dist[k][j]
                    }
                }
            }
        }
        
        return dist
    }
}

func floydWarshallTest() {
    
    let INF = Int(UInt16.max)
    
    // if weight exits put the value
    // unless use infinity
    //  0 ------> 3
    //  |   10    ^
    //  | 5     1 |
    //  V   3     |
    //  1 ------> 2
    let graph = [[0, 5, INF, 10],
                 [INF, 0, 3, INF],
                 [INF, INF, 0, 1],
                 [INF, INF, INF, 0]]
    
    let fw = FloydWarshall(graph: graph)
    print(fw.floydWarshellPair())
    
}
