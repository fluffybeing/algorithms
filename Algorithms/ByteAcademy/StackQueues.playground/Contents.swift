import Cocoa

struct Stack {
  var one = [Int]()
  var two = [Int]()
  
  mutating func push(_ element: Int) {
    // keeping insertion as O(1)
    //
    one.insert(element, at: 0)
  }
  
  mutating func pop() -> Int? {
    for _ in 0..<one.count - 1 {
      let elem = one.popLast()!
      two.insert(elem, at: 0)
    }
    let lastElem = one.popLast()
    one = two
    
    return lastElem
  }
}


var s = Stack()
s.push(5)
s.push(9)
s.push(10)
print(s.pop()!)
print(s.pop()!)
s.push(6)
print(s.pop()!)
