import Cocoa

class NStacks {
  var container: [Int] = [Int]()
  lazy var map: Dictionary<Int, [Int]> = {
    let emptyArray = Array(repeating: [Int](), count: n)
    return Dictionary(uniqueKeysWithValues: zip(0..<n, emptyArray))
  }()

  let n: Int
  let capacity: Int
  var count = 0

  init(n: Int, capacity: Int) {
    self.n = n
    self.capacity = capacity
  }

  func push(val: Int, in stack: Int) {
    guard stack < n, count < capacity else { return }

    count += 1
    container.append(val)
    map[stack]?.append(container.firstIndex(of: val)!)
  }

  func pop(from stack: Int) -> Int? {
    if let lastIndex = map[stack]?.popLast() {
      count -= 1
      return container[lastIndex]
    }

    return nil
  }
}

let stack = NStacks(n: 3, capacity: 10)
stack.push(val: 10, in: 0)
stack.push(val: 11, in: 2)

print(stack.pop(from: 0)!)
print(stack.pop(from: 2)!)

