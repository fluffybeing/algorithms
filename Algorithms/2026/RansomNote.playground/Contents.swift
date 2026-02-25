import UIKit

func ransomNote(_ note: String, _ mag: String) -> Bool {
  var hashMap = [Character: Int]()
  for char in mag {
    hashMap[char, default: 0] += 1
  }
  
  for char in note {
    if let count = hashMap[char], count > 0 {
      hashMap[char] = count - 1
    } else {
      return false
    }
  }
  return true
}

let note = "aa"
let magazine = "aab"
print(ransomNote(note, magazine))
