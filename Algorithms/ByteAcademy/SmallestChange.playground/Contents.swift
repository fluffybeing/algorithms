import Cocoa

func smallestChange(_ amount: Int, coins: [Int]) -> Int {
  if amount <= 0 {
    return 0
  }
  var mininmumCount = Int.max
  for coin in coins {
    let changeCount = 1 + smallestChange(amount - coin, coins: coins)
    mininmumCount = min(mininmumCount, changeCount)
  }
  
  return mininmumCount
}

let count = smallestChange(10, coins: [1, 2, 5])
print(count)


// dp problem

func smallestChangeDP(_ amount: Int, coins: [Int], memo: inout [Int: Int]) -> Int {
  if amount <= 0 {
    return 0
  }
  
  if let changeCount = memo[amount] { return changeCount }
  
  var mininmumCount = Int.max
  for coin in coins {
    let changeCount = 1 + smallestChange(amount - coin, coins: coins)
    mininmumCount = min(mininmumCount, changeCount)
  }
  
  memo[amount] = mininmumCount
  return mininmumCount
}

var memo = [Int: Int]()
let countdp = smallestChangeDP(10, coins: [1, 2, 5], memo: &memo)
print(countdp)
