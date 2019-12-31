import Cocoa


func isPalindrome(_ list: [Int]) -> Bool {
  guard !list.isEmpty else {
    return false
  }
  
  var left = 0
  var right = list.count - 1
  
  while left != right && (right >= 0 && left < list.count) {
    if list[left] != list[right] {
      return false
    }
    
    left += 1
    right -= 1
  }
  
  return true
}


print(isPalindrome([1, 2, 3]))
print(isPalindrome([1, 2, 1]))
print(isPalindrome([1, 1]))
