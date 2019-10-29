import Cocoa

func longestSubsequence(a: [Int], _ index: Int) -> Int {
  if index == 0 {
    return 1
  }

  var maxLength = 0
  if a[index - 1] < a[index] {
    maxLength = max(maxLength, longestSubsequence(a: a, index - 1) + 1)
  } else {
    maxLength = max(maxLength, longestSubsequence(a: a, index - 1))
  }

  return maxLength
}


let result = longestSubsequence(a: [6, 2, 5, 1, 7, 4, 8, 3], 7)
print(result)
