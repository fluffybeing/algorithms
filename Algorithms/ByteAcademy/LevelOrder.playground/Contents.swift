import Cocoa

class Node {
  var left: Node?
  var right: Node?
  
  let val: Int
  
  init(_ val: Int) {
    self.val = val
  }
}


func levelOrder(_ root: Node?) {
  guard let root = root else { return }
  
  var queue = [Node]()
  queue.insert(root, at: 0)
  
  while !queue.isEmpty {
    let node = queue.popLast()!
    print(node.val)
    
    if let left = node.left {
      queue.insert(left, at: 0)
    }
    
    if let right = node.right {
      queue.insert(right, at: 0)
    }
  }
}

let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.right = Node(4)
root.left?.left = Node(5)
root.right?.right = Node(6)
root.right?.left = Node(7)

levelOrder(root)
