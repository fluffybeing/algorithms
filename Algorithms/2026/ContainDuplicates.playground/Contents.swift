import UIKit

func containDuplicates(_ nums: [Int]) -> Bool {
  var hashMap = Set<Int>()
  
  for num in nums {
    if hashMap.contains(num) {
      return true
    }
    hashMap.insert(num)
  }
  
  return false
}


let nums = [1,2,3,1]

print(containDuplicates(nums))
