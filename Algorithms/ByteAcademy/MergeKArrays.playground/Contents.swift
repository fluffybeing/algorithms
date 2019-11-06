import Cocoa

class PriorityQueue<T: Comparable> {
  enum Kind {
    case min
    case max
  }

  let type: Kind
  var container: [T] = [T]()
  var isEmpty: Bool {
    return container.isEmpty
  }

  init(_ capacity: Int = 100, type: Kind = .min) {
    self.container.reserveCapacity(capacity)
    self.type = type
  }

  func add(_ item: T) {
    container.append(item)
    swim(container.count - 1)
  }

  func remove() -> T? {
    guard !container.isEmpty else { return nil }

    let elem = container.first!
    container[0] = container.last!
    container.popLast()
    heapify(0)
    return elem
  }

  func heapify(_ index: Int) {
    guard container.count > 1 else {
      return
    }
    let left = 2 * index + 1
    let right = 2 * index + 2

    var parent = index

    if left < container.count && container[parent] > container[left] {
      parent = left
    }

    if right < container.count && container[parent] > container[right] {
      parent = right
    }

    if parent != index {
      container.swapAt(parent, index)
      heapify(parent)
    }
  }

  func swim(_ index: Int) {
    let parent = (index - 1) / 2

    if parent >= 0 && container[parent] > container[index] {
      container.swapAt(parent, index)

      swim(parent)
    }
  }
}


struct Item: Comparable {
  let val: Int
  let arrayIndex: Int

  static func < (lhs: Item, rhs: Item) -> Bool {
    return lhs.val < rhs.val
  }
}

func mergeKSortedArray(_ arrays: [[Int]]) -> [Int] {
  let pq = PriorityQueue<Item>()
  var indexCounter = Array(repeating: 0, count: arrays.count)

  // insert the first element from each array to pq
  for (index, array) in arrays.enumerated() {
    let item = Item(val: array[0], arrayIndex: index)
    pq.add(item)
  }

  var sortedArray = [Int]()
  while !pq.isEmpty {
    let item = pq.remove()!
    sortedArray.append(item.val)
    indexCounter[item.arrayIndex] += 1

    // now add the new item add to pq
    let array = arrays[item.arrayIndex]
    if indexCounter[item.arrayIndex] < array.count {
      pq.add(Item(val: array[indexCounter[item.arrayIndex]], arrayIndex: item.arrayIndex))
    }
  }

  return sortedArray
}


let arrays = [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
let result = mergeKSortedArray(arrays)
print(result)
