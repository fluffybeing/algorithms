
import Cocoa

// XOR mirror the sum
// 1 0 0 1
// 0 0 0 1
// 1 0 0 0
// 0 0 0 1
// but we also need to handle the carry

func sum(_ a: Int, and b: Int) -> Int {
  var a = a
  var b = b
  
  while (b != 0) {
    print(String(b, radix: 2, uppercase: false))
    print(String(a, radix: 2, uppercase: false))

    let carry = a & b
    print(String(carry, radix: 2, uppercase: false))

    a = a ^ b
    b = carry << 1
  }
  
  return a
}



func sum2(_ a: Int, and b: Int) -> Int {
  if b == 0 { return a }
  
  return sum(a ^ b, and: (a & b) << 1)
}


print(sum(15, and: 35))
