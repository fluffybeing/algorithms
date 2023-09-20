import UIKit


// Solution
//   Loop in to check the number
//

func kClosestNumbers(_ k: Int, _ target: Int, _ list: [Int]) -> [Int] {
  
  let nearestIndex = binarySearch(list, target)
  var left = nearestIndex > 0 ? nearestIndex - 1 : 0
  var right = nearestIndex + 1
  
  while (right - left < k) {
    if (list[nearestIndex] - list[left]) > (list[right] - list[nearestIndex]) {
      right += 1
    } else {
      left += 1
    }
  }
  
  return Array(list[left...right])
}


func binarySearch(_ arr: [Int], _ target: Int) -> Int {
  guard !arr.isEmpty else {
    fatalError()
  }
  
  var low = 0
  var high = arr.count
  
  while low < high {
    let mid: Int = low + (high - low) / 2
    
    if arr[mid] == target {
      return mid
    }
    
    if target < arr[mid] {
      high = mid - 1
    } else {
      low = mid + 1
    }
  }
  
  return low
}


let result = kClosestNumbers(3, 7, [5, 6, 7, 8])
print(result)
