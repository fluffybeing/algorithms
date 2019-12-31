import Cocoa


//print(type(of:0xED))
//print(0x03 << 0 + 0xED)

func bigIntModule(_ bytes: [Int], b: Int) -> Int {
  var bigInt = 0x0
  for (i, elem) in bytes.reversed().enumerated() {
    // << precedence is greater that the *
    bigInt += elem << (i * 8)
    bigInt %= b
  }
  
  return bigInt
}

let result = bigIntModule([0x03, 0xED], b: 10)
print(result)
