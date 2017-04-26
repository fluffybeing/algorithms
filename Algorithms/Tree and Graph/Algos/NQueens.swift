//
//  BackTracking.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation


// N Queen Problem
struct NQueens {
    var solution: [[Int]]
    let queens: Int
    
    init(queens: Int) {
        self.queens = queens
        self.solution = [[Int]](repeating: [Int](repeating: 0, count: queens), count: queens)
    }
    
    mutating func solve() {
        if isAllQueensPlaced(queen: 0) {
            print("Queens Successfully Placed")
            
            for row in solution {
                print(row)
            }
            
        } else {
            print("No Solution")
        }
    }
    
    mutating func isAllQueensPlaced(queen: Int) -> Bool {
        if queen == self.queens {
            return true
        }
        
        for row in 0..<self.queens {
            if canPlace(row: row, column: queen) {
                self.solution[row][queen] = 1
            
                // Check for the next queen
                if isAllQueensPlaced(queen: queen + 1) {
                    return true;
                }
            
                // above placement didn't worked
                self.solution[row][queen] = 0;
            }
        }
        
        return false
    }
    
    func canPlace(row: Int, column: Int) -> Bool {
        
        // check if one same row another queen exits
        for i in 0..<column {
            if (solution[row][i] == 1) {
                return false
            }
        }
        
        // check upper left
        var i = row
        var j = column
        while(i >= 0 && j >= 0) {
            if (solution[i][j] == 1) {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // check lower left diagonal
        i = row
        j = column
        while(i < queens && j >= 0) {
            if (solution[i][j] == 1) {
                return false
            }
            i += 1
            j -= 1
        }
        
        return true
    }
}


func nqueensTest() {
    
    var nq = NQueens(queens: 8)
    nq.solve()
}
