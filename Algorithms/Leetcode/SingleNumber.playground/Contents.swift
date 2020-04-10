import Cocoa

func singleNumber(_ nums: [Int]) -> Int {
  guard !nums.isEmpty else { return Int.min }
  var num = nums.first!
  
  for elem in nums.dropFirst() {
    num ^= elem
  }
  
  return num
}


