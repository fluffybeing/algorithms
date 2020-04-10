import Foundation

func maxSubarraySum(_ arr: [Int]) -> Int {
  if arr.count == 1 { return arr[0] }
  let mid = arr.count / 2
  
  // find intersection sum
  var sum = 0
  var leftSum = Int.min
  for i in 0..<mid {
    sum += arr[i]
    leftSum = max(sum, leftSum)
  }

  sum = 0
  var rightSum = Int.min
  for i in mid..<arr.count {
    sum += arr[i]
    rightSum = max(sum, rightSum)
  }
  
  let maxLeftArray = maxSubarraySum(Array(arr[0..<mid]))
  let maxRightArray = maxSubarraySum(Array(arr[mid..<arr.count]))
  
  let maxOfLeftRight = max(maxLeftArray, maxRightArray)
  return max(leftSum+rightSum, maxOfLeftRight)
}

let result = maxSubarraySum([2, -4, 1, 9, -6, 7, -3])
print(result)
