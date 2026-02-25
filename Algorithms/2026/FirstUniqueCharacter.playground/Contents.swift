import UIKit

func firstUniqueCharacter(_ s: String) -> Int {
  
  var hashMap = [Character: Int]()
  for char in s {
    hashMap[char, default: 0] += 1
  }
  
  for (index, char) in s.enumerated() {
    if let count = hashMap[char], count == 1 {
      return index
    }
  }
  return -1
}

let s = "loveleetcode"
print(firstUniqueCharacter(s))
