//
//  main.swift
//  Algorithms
//
//  Created by Rahul Ranjan on 3/24/17.
//  Copyright © 2017 Rahul Ranjan. All rights reserved.
//

import Foundation

// MARK: Search
//binarySearchTest()

// MARK: Sorting
//insertionSortTest()
//selectionSortTest()
//mergeSortTest()

// quickSortTest()
// testPossiblePaths()

//testNQueen()
//nqueensTest()

//findMatchTest()
//isUniqueWithLoopTest()

//struct Empty: Decodable {}
//
//let d = "Cafe".data(using: .utf8)!
//
//let data = try! JSONDecoder().decode(Empty.self, from: d)
//
//print(data)

enum Check {
	case simple
	case associated(Int)
}

let a = Check.associated(5)

let b = Check.associated(6)

switch b {
	case .associated:
		print("Hello")
	default:
		print("Not")
}