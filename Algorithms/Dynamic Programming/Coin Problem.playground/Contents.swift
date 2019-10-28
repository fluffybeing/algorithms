import Cocoa

// Given a set of coin values {c1,c2,...,ck} and a sum of money x,
// our task is to form the sum x using as few coins as possible.


func minCoins(coins: [Int], target: Int) -> Int {
  if target == 0 {
    return 0
  }

  if target < 0 {
    return Int.max
  }

  var minimum = Int.max
  for coin in coins {
    if target - coin >= 0 {
      minimum = min(minimum, minCoins(coins: coins,
                                      target: target - coin) + 1)
    }
  }

  return minimum
}

func minCoinsFast(coins: [Int], target: Int, cache: inout [Int]) -> Int {
  if target == 0 {
    return 0
  }

  if target < 0 {
    return Int.max
  }

  if cache[target] > 0 {
    return cache[target]
  }

  var minimum = Int.max
  for coin in coins {
    if target - coin >= 0 {
      minimum = min(minimum,
                    minCoinsFast(coins: coins,
                                 target: target - coin,
                                 cache: &cache) + 1)
    }
  }

  cache[target] = minimum
  return minimum
}

func countSolutions(coins: [Int], target: Int, count: inout Int) -> Int {
  if target == 0 {
    return 1
  }

  var count = 0

  for coin in coins {
    if target - coin < 0 {
      continue
    }

    count += countSolutions(coins: coins, target: target - coin, count: &count)
  }

  return count
}


//var cache = [Int](repeating: -1, count: 11)
//cache[0] = 0
////let coins = minCoins(coins: [1, 2, 5], target: 10)
////let coins = minCoinsFast(coins: [1, 2, 5], target: 10, cache: &cache)
////print(coins)
//
//var count = 0
//let counts = countSolutions(coins: [1, 3, 4], target: 5, count: &count)
//print(counts)


