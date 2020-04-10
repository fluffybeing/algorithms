import Cocoa

let map = [
  "I": 1,
  "V": 5,
  "X": 10,
  "L": 50,
  "C": 100,
  "D": 500,
  "M": 1000
]

func romanToInt(_ s: String) -> Int {
  guard !s.isEmpty else { return Int.max }
  
  var val = 0
  var prev = 0
  for char in s {
    let charString = "\(char)".uppercased()
    
    if let num = map[charString] {
      if prev < num {
        val += num - 2 * prev
      } else {
        val += num
      }
      prev = num
    }
  }
  return val
}

let val = romanToInt("IX")
print(val)
