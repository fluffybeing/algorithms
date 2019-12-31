import Cocoa

func grayCode(_ a: Int, _ b: Int) -> Bool {
  let comparator = 1

  var xor = a ^ b
  var count = 0
  
  while xor != 0 {
    if (comparator & xor) == 0x1 {
      count += 1
    }
    
    xor >>= 1
  }
  
  return count == 1
}

let result = grayCode(2, 1)
print(result)
