import Cocoa

class Node {
  let val: Int
  
  var next: Node?
  var old: Node?
  
  init(_ val: Int) {
    self.val = val
  }
}

struct MaxStack {
  private var stack: Node?
  private var maxNode = Node(Int.min)
  
  mutating func push(_ elem: Int) {
    let node = Node(elem)
    
    // use linkedlist
    if stack == nil {
      stack = node
    } else {
      node.next = stack
      stack = node
    }
    
    // max node update
    if node.val > maxNode.val {
      node.old = maxNode
      maxNode = node
    }
  }
  
  mutating func pop() -> Int? {
    guard let s = stack else { return nil }
    
    stack = s.next
    maxNode = s.old ?? Node(Int.min)
    return s.val
  }
  
  func max() -> Int {
    return maxNode.val
  }
}


var ms = MaxStack()
ms.push(1)
print(ms.max())
ms.push(2)
print(ms.max())

