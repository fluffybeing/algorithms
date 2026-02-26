import UIKit


func containsDuplicate(_ nums: [Int], _ k: Int) -> Bool {
  var hashMap = [Int: [Int]]()
  for (index, num) in nums.enumerated() {
    hashMap[num, default: [Int]()] += [index]
  }
  
  for num in nums {
    if let indices = hashMap[num], indices.count > 1 {
      let i = indices[0]
      let j = indices[1]
      if abs(i - j) <= k {
        return true
      }
    }
  }
  return false
}

let nums = [1,2,3,1]
let k = 3
print(containsDuplicate(nums, k))
