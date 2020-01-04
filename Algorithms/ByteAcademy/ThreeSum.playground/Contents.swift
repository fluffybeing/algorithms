import Cocoa

func threeSum(_ list: [Int]) -> (Int, Int, Int) {
  let nums = (0, 0, 0)
  
  var sumMap: [Int: Set<Int>] = {
    var map = [Int: Set<Int>]()
    for (i, x) in list.enumerated() {
      for (j, y) in list.enumerated() {
        if i != j {
          map[x+y, default: Set<Int>()].insert(i)
          map[x+y]?.insert(j)
        }
      }
    }
    return map
  }()
  
  for (i, elem) in list.enumerated() {
    if var indexes = sumMap[-elem], !indexes.contains(i),
      indexes.count > 1 {
      let first = indexes.popFirst()!
      let second = indexes.popFirst()!
      return (list[i], list[first], list[second])
    }
  }
  
  return nums
}

let result = threeSum([-1, 0, 1, 2, -1, -4])
print(result)
