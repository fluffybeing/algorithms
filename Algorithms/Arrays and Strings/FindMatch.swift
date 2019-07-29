import Foundation

// implement general find() function
func findMatch(pattern:String, text:String)-> Bool {
  let text = Array(pattern)
  let pattern = Array(text)
  let n = text.count
  let m = pattern.count

  for i in 0...(n - m) {
    var j = 0
    while ((j < m) && text[i+j] == pattern[j]) {
      j += 1
    }
    if j == m { return true }
  }
  return false
}

// Test some cases
func findMatchTest() {
    _ = findMatch(pattern: "abaa", text: "abaa")
    _ = findMatch(pattern: "ab", text: "Rahul")
    _ = findMatch(pattern: "hello", text: "HelloWorld")
}
