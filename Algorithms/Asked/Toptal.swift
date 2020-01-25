import Foundation

// Approches
// P > E
// E > R
// R > U
// P < R
// Result PERU

// Result SPAIN

func findWord(_ arr: [String]) -> String {
  guard !arr.isEmpty else { return "" }
  
  var result = [Character]()
  for word in arr {
    let first = word.first!
    let second = word.last!
    
    if let firstIndex = result.firstIndex(where: { $0 == first }) {
      result.insert(second, at: firstIndex + 1)
    } else if let secondIndex =  result.firstIndex(where: { $0 == second }) {
      result.insert(first, at: secondIndex)
    } else {
      result.append(first)
      result.append(second)
    }
  }
    
  return result.map({String($0)}).joined()
}

let result = findWord(["P>E","E>R","R>U"])
let second = findWord(["I>N","A>I","P>A","S>P"])
