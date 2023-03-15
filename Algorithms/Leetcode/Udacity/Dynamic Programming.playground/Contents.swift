import UIKit

func fib(_ num: Int) -> Int {
  if (num <= 2) { return 1 }
  
  return fib(num - 1) + fib(num - 2)
}


  // Memo

func fib(_ num: Int, memo: inout [Int: Int]) -> Int {
  if let result = memo[num] { return result }
  
  if (num <= 2) {
    return 1
  }
  
  memo[num] = fib(num - 1) + fib(num - 2)
  
  return memo[num]!
}

  //var memo = [Int: Int]()
  //let a = fib(10, memo: &memo)
  //print(a)

  // Grid problem

func gridTravler(_ row: Int, _ col: Int) -> Int {
  if row == 1 && col == 1 { return 1 }
  if row == 0 || col == 0 { return 0 }
  
  return gridTravler(row - 1, col) + gridTravler(row, col - 1)
}


  // Memo
func gridTravler(_ row: Int, _ col: Int, memo: inout [String: Int]) -> Int {
  let key = "\(row),\(col)"
  if let result = memo[key] { return result }
  
  if row == 1 && col == 1 { return 1 }
  if row == 0 || col == 0 { return 0 }
  
  let ways = gridTravler(row - 1, col) + gridTravler(row, col - 1)
  memo[key] = ways
  memo[String(key.reversed())] = ways
  
  return ways
}

  //var memo = [String: Int]()
  //let r = gridTravler(3, 3, memo: &memo)
  //print(r)




func canSum(_ num: Int, _ list: [Int]) -> Bool {
  if num == 0 { return true }
  if num < 0 { return false }
  
  for n in list {
    let remainder = num - n
    if canSum(remainder, list) { return true }
  }
  
  return false
}


func canSum(_ num: Int, _ list: [Int], memo: inout [Int: Bool]) -> Bool {
  if let result = memo[num] { return result }
  
  if num == 0 { return true }
  if num < 0 { return false }
  
  for n in list {
    let remainder = num - n
    if canSum(remainder, list) {
      memo[num] = true
      return true
    }
  }
  
  memo[num] = false
  return false
}


//let result = canSum(7, [5, 3, 4, 7])
//print(result)


func howSum(_ targetSum: Int, _ list: [Int]) -> [Int]? {
  if targetSum == 0 { return [] }
  if targetSum < 0 { return nil }
  
  for n in list {
    let remainder = targetSum - n
    if let remainderResult = howSum(remainder, list) {
      return remainderResult + [n]
    }
  }
  
  return nil
}

func howSum(_ targetSum: Int, _ list: [Int], memo: inout [Int: [Int]?]) -> [Int]? {
  if let result = memo[targetSum] { return result }
  
  if targetSum == 0 { return [] }
  if targetSum < 0 { return nil }
  
  for n in list {
    let remainder = targetSum - n
    if let remainderResult = howSum(remainder, list) {
      memo[targetSum] = remainderResult + [n]
    }
  }
  
  return memo[targetSum] ?? nil
}

//var memo = [Int: [Int]?]()
//let result = howSum(8, [2, 3, 5], memo: &memo)
//print(result)

func bestSum(_ targetSum: Int, _ list: [Int]) -> [Int]? {
  if targetSum == 0 { return [] }
  if targetSum < 0 { return nil }
  
  var shortestCombination: [Int]? = nil
  
  for n in list {
    let remainder = targetSum - n
    let remainderCombination = bestSum(remainder, list)
    if let r = remainderCombination {
      let combination = r + [n]
      
      if shortestCombination == nil {
        shortestCombination = combination
      }
      
      if let s = shortestCombination, combination.count < s.count {
        shortestCombination = combination
      }
    }
  }
  
  return shortestCombination
}

//let result = bestSum(7, [5, 3, 4, 7])
//print(result)

func bestSum(_ targetSum: Int, _ list: [Int], memo: inout [Int: [Int]?]) -> [Int]? {
  if let result = memo[targetSum] { return result }
  
  if targetSum == 0 { return [] }
  if targetSum < 0 { return nil }
  
  var shortestCombination: [Int]? = nil
  
  for n in list {
    let remainder = targetSum - n
    let remainderCombination = bestSum(remainder, list, memo: &memo)
    if let r = remainderCombination {
      let combination = r + [n]
      
      if shortestCombination == nil {
        shortestCombination = combination
      }
      
      if let s = shortestCombination, combination.count < s.count {
        shortestCombination = combination
      }
    }
  }
  
  memo[targetSum] = shortestCombination
  return shortestCombination
}
//
//var memo = [Int: [Int]?]()
//let result = bestSum(100, [1, 2, 5, 25], memo: &memo)
//print(result)

func canConstruct(_ targetString: String, _ wordBank: [String]) -> Bool {
  if targetString.isEmpty { return true }
  
  for word in wordBank {
    if targetString.contains(word) {
      let remainderString = targetString.replacingOccurrences(of: word, with: "")
      if canConstruct(remainderString, wordBank) { return true }
    }
    
  }
  
  return false
}

//let result = canConstruct("hello", ["ll", "o", "he"])
//print(result)


func countConstruct(_ targetString: String, _ wordBank: [String]) -> Int {
  if targetString.isEmpty { return 1 }
  
  var totalCount = 0
  
  for word in wordBank {
    if targetString.contains(word) {
      let remainderString = targetString.replacingOccurrences(of: word, with: "")
      let numberOfWays = countConstruct(remainderString, wordBank)
      totalCount += numberOfWays
    }
  }
  
  return totalCount
}

func allConstruct(_ targetString: String, _ wordBank: [String]) -> [[String]] {
  if targetString.isEmpty { return [[]] }
  
  var result = [[String]]()
  for word in wordBank {
    if targetString.contains(word) {
      let remainderString = targetString.replacingOccurrences(of: word, with: "")
      let suffixWays = allConstruct(remainderString, wordBank)
      let targetWays = suffixWays.map {
        $0 + [word]
      }
      result.append(contentsOf: targetWays)
    }
  }
  
  return result
}


// Tabulation

