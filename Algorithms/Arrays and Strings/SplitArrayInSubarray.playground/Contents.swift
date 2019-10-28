import Cocoa

public func solution(_ A : inout [Int]) -> Bool {
  // write your code in Swift 4.2.1 (Linux)

  var i = 0
  var j = A.count - 1

  while i < j {
    let left = Array(A[0..<i]).reduce(0, +) // performance
    let right = Array(A[j..<A.count-1]).reduce(0, +)

    if left == right {
      if Array(A[i+1..<j]).reduce(0, +) == left {
        return true
      }
      i += 1
      j -= 1
    } else if left < right {
      i += 1
    } else {
      j -= 1
    }
  }

  return false
}

var a =   [1, 1, 1, 1, 1, 1]
let result = solution(&a)
print(result)
