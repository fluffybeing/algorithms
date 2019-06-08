import Foundation

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
               return false
        }
  
        var palindrome = 0
        var num = x
  
        while(num > 0) {
           palindrome *= 10
           palindrome += num % 10
           num = Int(num/10)
       }
 
       return palindrome == x
    }
}
