import UIKit

func isPalindrome(str: String) -> Bool {
  let reverse = str.reversed()

  return str == String(reverse)
}

func longestPalindrome(_ s: String) -> String {
  guard s.count > 1 else { return s }
  let s = Array(s)

  for i in 0..<s.count {}
  return ""
}


longestPalindrome("bab")
