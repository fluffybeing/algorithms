import Cocoa

func mergeArrays(a: [Int], b: [Int]) -> [Int] {
  var a = a
  var mergeIndex = a.count - 1
  var j = b.count - 1
  var i = a.count - b.count - 1

  while mergeIndex >= 0 {
    if j >= 0, b[j] > a[i] {
      a[mergeIndex] = b[j]
      j -= 1
    } else if i >= 0 {
      a[mergeIndex] = a[i]
      i -= 1
    }
    mergeIndex -= 1
  }

  return a
}


let a = [1, 3, 5, 0, 0, 0]
let b = [2, 4, 6]

let result = mergeArrays(a: a, b: b)
print(result)
