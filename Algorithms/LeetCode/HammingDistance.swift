import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
  let xBinaryString = String(x, radix: 2)
  let yBinaryString = String(y, radix: 2)

  let xPaded = pad(string: xBinaryString)
  let yPaded = pad(string: yBinaryString)

  var hammingDistanceCount = 0
  for index in xPaded.characters.indices {
          if xPaded[index] != yPaded[index] {
                  hammingDistanceCount += 1
          }
  }	
  return hammingDistanceCount
}

func pad(string : String, toSize: Int = 64) -> String {
  var padded = string
  for _ in 0..<(toSize - string.characters.count) {
          padded.insert("0", at: string.startIndex)
  }
  return padded
}

let result = hammingDistance(1577962638, 1727613287)
print(result)
