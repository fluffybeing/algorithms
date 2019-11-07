import Cocoa

// we can use only one hashmap, we can increament in one
// then decment

// another optimization we can do is use XOR

func isAnagram(_ s1: String, _ s2: String) -> Bool {
  guard s1.count == s2.count else {
    return false
  }

  let s1 = s1.lowercased()
  let s2 = s2.lowercased()

  var hashMap = [Character: Int]()
  for char in s1 {
    hashMap[char, default: 0] += 1
  }

  for char in s2 {
    hashMap[char, default: 0] -= 1
  }

  return !hashMap.values.contains(where: {$0 > 1})
}


let result = isAnagram("A", "a")
print(result)
