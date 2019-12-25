import Cocoa

func countCoins(_ val: Int, coins: [Int], counter: inout [Int]) -> Int {
  if val == 0 {
    return 0
  }

  if val < 0 {
    return 0
  }

  var minimum = Int.max
  for (index, coin) in coins.enumerated() {
    let currentCount = countCoins(val - coin, coins: coins, counter: &counter) + 1
    if minimum > currentCount {
      minimum = currentCount
      counter[index] += 1
    }
  }

  return minimum
}

var counter = [0, 0, 0, 0]
var coins = [1, 2, 5, 10]

let result = countCoins(12, coins: coins, counter: &counter)
print(result)
print(counter)
