import Cocoa

func moveZeroes(_ nums: inout [Int]) {
  guard !nums.isEmpty else { return }
  
  var i = 0
  var j = 0
  
  while j < nums.count {
    if nums[j] != 0 {
      nums[i] = nums[j]
      i += 1
    }
    
    j += 1
  }
  
  while i < nums.count {
    nums[i] = 0
    i += 1
  }
}


var arr = [0,1,0,3,12]
moveZeroes(&arr)
print(arr)


func majorityElement(_ nums: [Int]) -> Int {
  var map = [Int: Int]()
  
  var maxTrack = (0, 0)
  for elem in nums {
    map[elem, default: 0] += 1
    
    if let val = map[elem], val > maxTrack.1 {
      maxTrack = (elem, val)
    }
  }
  
  return maxTrack.0
}
