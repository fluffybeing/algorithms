import Cocoa

func zeroSumSubArray(_ arr: [Int]) -> [Int] {
  guard !arr.isEmpty else { return [] }

  var hashMap = [Int: Int]()
  var sum = 0
  for (index, elem) in arr.enumerated() {
    sum += elem

    if hashMap.keys.contains(sum), let start = hashMap[sum] {
      return Array(arr[start+1...index])
    } else {
      hashMap[sum] = index
    }
  }

  return []
}


let result = zeroSumSubArray([1, 2, -5, 1, 2, -1])
print(result)
