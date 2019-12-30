import Cocoa

func sortStack(_ stack: [Int]) -> [Int] {
  var stack = stack
  var tempStack = [Int]()
  
  while !stack.isEmpty {
    let elem = stack.popLast()!
    
    while let last = tempStack.last, last > elem {
      stack.append(tempStack.popLast()!)
    }
    
    tempStack.append(elem)
  }
  
  return tempStack
}


let sorted = sortStack([1, 5, 3, 2, 4])
print(sorted)
