//
//  RobotInGrid.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 4/4/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

//     C
//     ______________
// R  |r0c0 r0c1 r0c2|
//    |r1c0 r1c1 r1c2|
//    |r2c0 r2c1 r2c2|
//     --------------
// r2c2 -> adjacent (r1c2, r2c1)
//                  /  \    /  \
//               r0c2 r1c1 r1c1 r2c0
//                   |-common-|


struct Point {
    var row: Int
    var col: Int
    
    init(row: Int, col: Int) {
        self.row = row
        self.col = col
    }
}

func robotInAGrid(maze: [[Bool]]) -> Bool? {
    if maze.isEmpty {
        return nil
    }
    
    if getPath(maze: maze, row: maze.count - 1, col: maze[0].count - 1, path: [Point](), failedPoints: Set<Point>()) {
        return true
    }
    return false
}

func getPath(maze: [[Bool]], row: Int, col: Int, path: [Point], failedPoints: Set<Point>) -> Bool {
    
    var path = path
    var failedPoints = failedPoints
    
    if col < 0 || row < 0 || !maze[row][col] {
        return false
    }
    
    let point = Point(row: row, col: col)
    
    // if this point already visited
    if failedPoints.contains(point) {
        return false
    }
    
    let atOrigin = (row == 0) && (col == 0)
    
    // recurse through one row up and one column back towards origin
    if atOrigin || getPath(maze: maze, row: row - 1, col: col, path: path, failedPoints: failedPoints) || getPath(maze: maze, row: row, col: col - 1, path: path, failedPoints: failedPoints) {
        path.append(point)
        return true
    }
    
    failedPoints.insert(point)
    return false
}

extension Point: Hashable {
    static public func ==(lhs: Point, rhs: Point) -> Bool {
        return lhs.row == rhs.row && lhs.col == rhs.col
    }
}

func robotInAGridTest() {
    
    var maze = [[Bool]](repeating:[Bool](repeating: true, count: 4), count: 4)
    maze[2][2] = false
    
    assert(robotInAGrid(maze: maze)! == true)
}
