import Cocoa

func findMin(_ nums: [Int]) -> Int {
  guard nums.count > 1 else {
    return nums.first ?? 0
  }

  let mid = (nums.count - 1) / 2
  var minVal = 0
  if nums[mid] > nums.last! {
    minVal = findMin(Array(nums[mid+1..<nums.count]))
  } else {
    minVal = findMin(Array(nums[0...mid]))
  }

  return minVal
}

findMin([1, 2])
