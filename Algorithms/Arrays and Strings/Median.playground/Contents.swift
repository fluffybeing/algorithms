import Cocoa

// [4, 7, 9]
// [2, 5, 10, 14]   -> [2, 4, 5, 7, 9, 10, 14] -> 7
// midX = 2
// midY = 0
// [] [1, 3]
// [2], []
//
func findMedian(_ nums1: [Int], _ nums2: [Int]) -> Double {
  guard nums1.count <= nums2.count else {
    return findMedian(nums2, nums1)
  }

  let oneSize = nums1.count
  let twoSize = nums2.count
  let total = oneSize + twoSize

  var start = 0
  var end = oneSize

  while start <= end {
    let midX = (start + end) / 2
    let midY = (total + 1)/2 - midX

    // The four numbers needed for comparision
    // left numbers
    // right numbers
    let xLeft = midX == 0 ? Int.min : nums1[midX - 1]
    let xRight = midX == oneSize ? Int.max : nums1[midX]
    let yLeft = midY == 0 ? Int.min : nums2[midY - 1]
    let yRight = midY == twoSize ? Int.max : nums2[midY]

    if xLeft <= yRight && yLeft <= xRight {
      if total % 2 == 0 {
        return Double(max(xLeft, yLeft) + min(xRight, yRight)) / 2.0
      } else {
        return Double(max(xLeft, yLeft))
      }

    } else if yLeft > xRight {
      start = midX + 1
    } else {
      end = midX - 1
    }
  }
  return -1
}

let res = findMedian([],  [2])
print(res)
