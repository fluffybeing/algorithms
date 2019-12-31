import Cocoa

func rotateBits(_ bits: Int, times: Int) -> Int {
  let bitSize = 32
  // this is what the actual rotation is needed
  let rotation = bitSize % times
  
  // clock wise rotation
  // it took me hard time to visulaize this ```bits << (bitSize - rotation)```
  // let go though an example
  // 0b...0111: Rotate this with 3 place
  // Right shift: 0b...0000 // 3 zero will be added
  // we need to append the 111 and so to get this how much shift is required (size - rotation)
  // 32 - 3 = 29 // I haven't represented the number with 32 bits
  // 0b111..000
  //0b111..000 | 0b000000
  return (bits >> rotation) | bits << (bitSize - rotation)
}

