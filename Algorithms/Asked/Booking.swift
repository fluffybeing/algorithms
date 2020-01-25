import Foundation

// Question: 1
public func groupAnagrams(lines: [String]) -> [String] {
  var groupedAnagrams = [String: [String]]()

  for word in lines {
    let sortedWord = String(word.sorted())
    groupedAnagrams[sortedWord, default: []].append(word)
  }
  
  let result = groupedAnagrams.values.map{ $0.joined(separator: ",")} 
    
  return result
}

// Question: 2
extension Array where Element == Int {
  public func deltaEncoded() -> [Element] {
    guard !self.isEmpty else { return [] }
    
    var result = [self.first!]
    var index = 1
    
    while index < self.count {
      let diff = self[index] - self[index - 1]
      
      if diff < -127 || diff > 127 {
        result.append(-128)
      }
      
      result.append(diff)
      index += 1
    }
    return result
  }
}
  
// Question: 3
func polygonCount(from lines: [String]) -> [Int] {
  guard !lines.isEmpty else { return [] }
  
  var result = [0, 0, 0, 0]

  for line in lines {
    let sides = line.split(separator: " ").map{ Int($0)! }
    
    if sides.contains(where: ({ $0 < 1 })) {
      result[3] += 1
    } else if sides.count < 3 {
      result[3] += 1
    } else if sides.count == 3 || sides.count > 4 {
      result[2] += 1
    } else {
      if sides[0] == sides[1] && sides[0] == sides[2] && sides[0] == sides[3] {
        result[0] += 1
      } else if sides[0] == sides[2] && sides[1] == sides[3] {
        result[1] += 1
      } else {
        result[2] += 1
      }
    }
  }
  
  return result
}

// Question: 4
func rounded(_ price: Int, to insignificantDigits: Int) -> Int {
  let decimals = pow(Double(10), Double(insignificantDigits))
  let ratio = (Double(price) / decimals)
  let fractionValue = price < 0 ? ratio.rounded(.up) : ratio.rounded()
  return Int(decimals) * Int(fractionValue)
}


