
import Foundation

// Question 561

func arrayPairSum(_ nums: [Int]) -> Int {

  let sortedNums = nums.sorted()

  var sum = 0
  for index in stride(from: 0, to: sortedNums.count, by: 2) {
          sum += min(sortedNums[index], sortedNums[index+1])
  }

  return sum
}

let result = arrayPairSum([1, 4, 2, 3])
print(result)
