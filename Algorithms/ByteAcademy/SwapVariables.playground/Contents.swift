import Cocoa

func swap(_ a: inout Int, b: inout Int) {
//  a = a + b
//  b = a - b
//  a = a - b
//
  
  // bitwise
  a = a ^ b
  b = a ^ b
  a = a ^ b
}


var a = 2, b = 5
swap(&a, &b)
print(a, b)
