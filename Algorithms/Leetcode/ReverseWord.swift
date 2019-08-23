
import Foundation

func reverseWords(_ s: String) -> String {
	let wordArray = s.components(separatedBy: " ")	
	
	return wordArray.map {String($0.reversed())}.joined(separator: " ")
}

func testReverseWord() {
  let result = reverseWords("Let's take LeetCode contest")
  print(result)
}
