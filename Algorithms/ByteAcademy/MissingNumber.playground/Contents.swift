import Cocoa


// This solution is not that great and there is an XOR
// based one but I wasn't able to understand it for now
// will tackle that later
func missing(_ nums: [Int], size: Int) -> [Int] {
  let sum = nums.reduce(0, +)
  let totalSum = size * (size + 1) / 2
  
  // if we know the average it means
  // one number must be less than that and
  // another must be greater or both of them
  // should be equal
  let avg = (totalSum - sum) / 2
  
  var twoNums = [Int]()
  for i in 1...avg {
    if !nums.contains(i) {
      twoNums.append(i)
      break
    }
  }
  
  // other nums
  let otherNums = 2 * avg - twoNums.first!
  twoNums.append(otherNums)
  return twoNums
}


let nums = [4, 2, 3]
print(missing(nums, size: 5))
