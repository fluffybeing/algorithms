import Cocoa

class Node {
  var left: Node?
  var right: Node?
  
  let val: Int
  
  init(_ val: Int) {
    self.val = val
  }
}

func longestConsecutiveBranch(root: Node?, prev: Node? = nil) -> Int {
  guard let current = root else { return 0 }
  
  let left: Int
  let right: Int
  
  if let lastVal = prev?.val, lastVal + 1 == current.val {
    left = 1 + longestConsecutiveBranch(root: current.left, prev: current)
    right = 1 + longestConsecutiveBranch(root: current.right, prev: current)
  } else {
    left = longestConsecutiveBranch(root: current.left, prev: current)
    right = longestConsecutiveBranch(root: current.right, prev: current)
  }
  
  return max(left, right)
}


var root = Node(0)
root.left = Node(1)
root.right = Node(2)
root.right?.right = Node(3)
root.right?.right?.right = Node(4)
root.right?.right?.right?.right = Node(5)
root.left?.left = Node(2)
root.left?.right = Node(5)

let result = longestConsecutiveBranch(root: root)
print(result)
