import Foundation

// implement general find() function
func findMatch(pattern:String, text:String)-> Bool {
  let text = Array(pattern)
  let pattern = Array(text)
  let m = pattern.count
  
  for i in 0..<text.count {
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
  let r1 = findMatch(pattern: "abaa", text: "abaa")
  let r2 = findMatch(pattern: "ab", text: "Rahul")
  let r3 = findMatch(pattern: "hello", text: "HelloWorld")

  assert(r1 == true)
  assert(r2 == false)
  assert(r3 == false)
}
