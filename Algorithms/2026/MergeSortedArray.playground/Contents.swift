import UIKit


func mergeSortedArray(_ a: [Int], _ b: [Int]) -> [Int] {
  var result = [Int]()
  
  
  let minCount = min(a.count, b.count)
  
  var aIndex = 0
  var bIndex = 0
  while aIndex < minCount && bIndex < minCount {
    if a[aIndex] > b[bIndex] {
      result.append(b[bIndex])
      bIndex += 1
    } else if a[aIndex] < b[bIndex] {
      result.append(a[aIndex])
      aIndex += 1
    } else {
      result.append(a[aIndex])
      result.append(b[bIndex])
      aIndex += 1
      bIndex += 1
    }
  }
  
  if aIndex == minCount {
    result.append(contentsOf: b[bIndex...])
  } else {
    result.append(contentsOf: a[aIndex...])
  }
  
  return result
}

let nums1 = [1,2,3,0,0,0]
let nums2 = [2,5,6]

print(mergeSortedArray(nums1, nums2))
