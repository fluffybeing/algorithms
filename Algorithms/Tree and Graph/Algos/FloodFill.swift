//
//  FloodFill.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/24/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

struct FloodFill {
    let array: [[Int]]
    var visited: [[Bool]]
    let rowSize: Int
    let columnSize: Int
    
    init(array: [[Int]]) {
        self.array = array
        self.rowSize = array.count
        self.columnSize = array[0].count
        self.visited = [[Bool]](repeating: [Bool](repeating: false, count: columnSize), count: rowSize)
    }
    
    mutating func floodFill(sourceRow: Int, sourceColumn: Int,
                            destinationRow: Int, destinationColumn: Int) -> Bool {
        if(sourceRow == destinationRow) && (sourceColumn == destinationColumn) {
            return true
        }
        if (sourceRow >= rowSize) || (sourceColumn >= columnSize) {
            return false
        }
        if (sourceRow < 0) || (sourceColumn < 0) {
            return false
        }
        if (array[sourceRow][sourceColumn] == 0) {
            return false
        }
        
        if (visited[sourceRow][sourceColumn] == true) {
            return false
        }
        
        visited[sourceRow][sourceColumn] = true
        
        if (floodFill(sourceRow: sourceRow + 1, sourceColumn: sourceColumn,
                      destinationRow: destinationRow, destinationColumn: destinationColumn) == true) {
            return true
        }
        
        if (floodFill(sourceRow: sourceRow - 1, sourceColumn: sourceColumn,
                      destinationRow: destinationRow, destinationColumn: destinationColumn) == true) {
            return true
        }
        
        if (floodFill(sourceRow: sourceRow, sourceColumn: sourceColumn - 1,
                      destinationRow: destinationRow , destinationColumn: destinationColumn) == true) {
            return true
        }
        
        if (floodFill(sourceRow: sourceRow, sourceColumn: sourceColumn + 1,
                      destinationRow: destinationRow, destinationColumn: destinationColumn ) == true) {
            return true
        }
        
        return false
    }
}


func floodFillTest() {
    let twoDimensionalArray = [[1, 0, 1],
                               [1, 0, 0],
                               [1, 1, 1]]
    var ff = FloodFill(array: twoDimensionalArray)
    print(ff.floodFill(sourceRow: 0, sourceColumn: 0, destinationRow: 2, destinationColumn: 2))
}
