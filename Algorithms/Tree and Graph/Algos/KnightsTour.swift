//
//  KnightsTour.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/26/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

struct KnightsTour {
    var board: [[Int]]
    let size: Int
    // A knight can move in these 8 directions
    let possibleMoves = [(2, 1), (1, 2),
                         (-1, 2),(-2, 1),
                         (-2, -1), (-1, -2),
                         (1, -2), (2, -1)]
    
    init(size: Int) {
        self.size = size
        self.board = [[Int]](repeating: [Int](repeating: -1, count: size), count: size)
    }
    
    mutating func solve() {
        
        // start from the 00 position
        board[0][0] = 0
        
        if backTrack(row: 0, column: 0, moveCount: 1) {
            print("Visited Successfully!")
            
            for row in board {
                print(row)
            }
        } else {
            print("Not Possible!")
        }
        
    }
    
    mutating func backTrack(row: Int, column: Int, moveCount: Int) -> Bool {
        if moveCount == size * size {
            return true
        }
        
        // Try all the next possible movies
        for move in possibleMoves {
            let nextRow = row + move.0
            let nextColumn = column + move.1
            
            if isSafeIndex(row: nextRow, column: nextColumn) {
                board[nextRow][nextColumn] = moveCount
                
                // Now check for the next move
                if backTrack(row: nextRow, column: nextColumn, moveCount: moveCount + 1) {
                    return true
                }
                
                board[nextRow][nextColumn] = -1
            }
            
        }
        
        return false
    }
    
    func isSafeIndex(row: Int, column: Int) -> Bool {
        
        return row >= 0 && row < size
            && column >= 0 && column < size
            && board[row][column] == -1
    }
}


func knightTourTest() {
    
    var kt = KnightsTour(size: 8)
    kt.solve()
}
