import UIKit


// If we hit the same sum, it means there was elements which
// nullified the values and hence those elements create the
// zero sum
func zeroSubArray(_ nums: [Int]) -> Bool {
  var sums: Set<Int> = [0]
  
  var sumTillNow = 0
  for num in nums {
    sumTillNow += num
    
    if sums.contains(sumTillNow) {
      return true
    }
    
    sums.insert(sumTillNow)
  }
  
  return false
}


let nums = [4, 2, -3, 1, 6]

print(zeroSubArray(nums))
