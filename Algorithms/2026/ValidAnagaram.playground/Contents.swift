import UIKit


func validAnagram(_ s: String, _ t: String) -> Bool {
  guard s.count == t.count else {
    return false
  }
  
  var firstHashMap = [Character: Int]()
  for character in s {
    firstHashMap[character, default: 0] += 1
  }
  
  for character in t {
    if let count = firstHashMap[character], count > 0 {
      firstHashMap[character] = count - 1
    } else {
      return false
    }
  }
  
  return true
}

let s = "cat"
let t = "rat"

print(validAnagram(s, t))
