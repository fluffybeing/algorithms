import UIKit


func moveZeros(_ nums: [Int]) {
  var nonZeroArray = [Int]()
  var zeroCount = 0
  
  for num in nums {
    if num == 0 {
      zeroCount += 1
    } else {
      nonZeroArray.append(num)
    }
  }
  
  return nonZeroArray.append(contentsOf: Array(repeating: 0, count: zeroCount))
}

func moveZeros2(_ nums: inout [Int]) {
  var zeroCount = 0
  var index = 0
  var nonZeroIndex = 0
  while index < nums.count {
    if nums[index] == 0 {
      zeroCount += 1
    } else {
      nums[nonZeroIndex] = nums[index]
      nonZeroIndex += 1
    }
    
    index += 1
  }
  
  for i in 0..<zeroCount {
    nums[nums.count - 1 - i] = 0
  }
}

var nums = [0,1,0,3,12]
moveZeros2(&nums)
print(nums)
