import Cocoa

// items (value, weight)
// maxWeight

// f(0) = 0
// f(i) = val + f(n - i)
// Brute force

typealias Map = [Int: [Int: Int]]

struct Item: Equatable {
  let value: Int
  let weight: Int

  static func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.value == rhs.value
      && lhs.weight == rhs.weight
  }
}

private func knapsackBrute(items: [Item], maxWeight: Int) -> Int {
  if maxWeight == 0 {
    return 0
  }

  if maxWeight < 0 {
    return Int.min
  }

  var maxValue = Int.min
  for item in items {
    if maxWeight < item.weight { continue }

    maxValue = max(maxValue, knapsackBrute(items: items,
                                           maxWeight: maxWeight - item.weight) + item.value)
  }

  return maxValue
}

private func knapsack(items: [Item], maxWeight: Int, cache: inout [Int]) -> Int {
  if maxWeight == 0 {
    return 0
  }

  if maxWeight < 0 {
    return Int.min
  }

  if cache[maxWeight] >= 0 {
    return cache[maxWeight]
  }

  var maxValue = Int.min
  for item in items {
    if maxWeight < item.weight { continue }

    maxValue = max(maxValue, knapsack(items: items,
                                      maxWeight: maxWeight - item.weight,
                                      cache: &cache) + item.value)
  }

  cache[maxWeight] = maxValue
  return maxValue
}


let items = [Item(value: 6, weight: 2),
             Item(value: 10, weight: 2),
             Item(value: 12, weight: 3)]
var cache = [Int](repeating: -1, count: 6)
cache[0] = 0
//let result = knapsackBrute(items: items, maxWeight: 5)
let result = knapsack(items: items, maxWeight: 5, cache: &cache)
print(result)



//
// Basically I need to understand what is going behind the
// scene
var store = [Int: Int]()
func zeroOneKnapscak(items: [Item], maxWeight: Int) -> Int {
  if maxWeight == 0 {
    return 0
  }
  
  if let val = store[maxWeight] {
    return val
  }
  
  var maxValue = Int.min
  for item in items {
    if item.weight > maxWeight { continue }
    
    maxValue = max(maxValue,
                   zeroOneKnapscak(items: items,
                                   maxWeight: maxWeight - item.weight) + item.value)

  }
  
  store[maxWeight] = maxValue
  
  return maxValue
}
