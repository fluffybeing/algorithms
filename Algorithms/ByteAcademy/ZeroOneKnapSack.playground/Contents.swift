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

func knapsackBrute(_ items: [Item], _ weight: Int) -> Int {
  var cache = Map()
  return knapsack(items, weight, 0, &cache)
}

private func knapsackBrute(_ items: [Item],
                           _ weight: Int,
                           _ index: Int) -> Int {
  if index == items.count {
    return 0
  }

  let item = items[index]
  if weight - item.weight < 0 {
    return knapsackBrute(items, weight, index + 1)
  }

  return max(knapsackBrute(items, weight - item.weight, index+1) + item.value,
             knapsackBrute(items, weight, index + 1))
}

// Using memoisation
private func knapsack(_ items: [Item],
                      _ weight: Int,
                      _ index: Int,
                      _ cache: inout Map) -> Int {
  if index == items.count {
    return 0
  }

  if let val = cache[index]?[weight] {
    return val
  }

  let item = items[index]
  let toReturn: Int
  if weight - item.weight < 0 {
    toReturn = knapsack(items, weight, index + 1, &cache)
  } else {
    toReturn = max(knapsack(items, weight - item.weight, index + 1, &cache) + item.value,
                   knapsack(items, weight, index + 1, &cache))
  }

  cache[index] = [weight: toReturn]
  return toReturn
}


let items = [Item(value: 6, weight: 2),
             Item(value: 10, weight: 2),
             Item(value: 12, weight: 3)]
let result = knapsackBrute(items, 5)
print(result)
