import Cocoa

func nearestSmallerElement(_ arr: [Int], target: Int) -> Int? {
  guard !arr.isEmpty else {
    return nil
  }

  var i = 0
  var chain = [Int]()

  while i < arr.count {
    // at start move the index till we find
    // the descend
    if arr[i] == target, !chain.isEmpty {
      return chain.last
    }

    if i+1 < arr.count {
      if arr[i+1] > arr[i] {
        // add the element to chain
        chain.append(arr[i])
      } else {
        // remove from the chain
        if var last = chain.popLast() {
          while arr[i] > last && chain.count > 1 {
            last = chain.removeLast()
          }
        }
      }
    }
    i += 1
  }

  return chain.last
}


let result = nearestSmallerElement([1, 3, 4, 2, 5, 3, 4, 2], target: 5)
print(result)
