import Cocoa

func findConsecutive(a: [Int]) -> Int {
  guard !a.isEmpty else { return 0 }

  let set = Set(a)

  var maxCount = 0
  for elem in a {
    if set.contains(elem - 1) { continue }
    else {
      var count = 0
      var currentElem = elem

      while set.contains(currentElem) {
        count += 1
        currentElem = currentElem + 1
      }

      maxCount = max(count, maxCount)
    }
  }
  return maxCount
}



let result = findConsecutive(a: [4, 2, 1, 6, 5])
print(result)
