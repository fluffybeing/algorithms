import Cocoa

class Node {
  var left: Node?
  var right: Node?
  let val: Int
  
  init(_ val: Int) {
    self.val = val
  }
}

/// consider below tree
///            0
///          /   \
///         1     2
/// Null <- 1 <-> 0 <-> 2 <-> 1
func treeToDoublyLinkedList(_ t: Node?, head: inout Node?, prev: inout Node?) {
  guard let current = t else { return }
  
  treeToDoublyLinkedList(current.left, head: &head, prev: &prev)
  
  // if prev is null then head is our root
  // unless set previous right to root
  current.left = prev

  if prev != nil {
    prev?.right = current
  } else {
    head = current
  }
  
  prev = current
  treeToDoublyLinkedList(current, head: &head, prev: &prev)
}

var root = Node(0)
root.left = Node(1)
root.right = Node(2)

var prev: Node? = nil
var head: Node? = root
treeToDoublyLinkedList(root, head: &head, prev: &prev)

for _ in 0..<3 {
  print(head!.val)
  head = head!.right
}


func average(_ a: Int, _ b: Int) -> Int {
  let sum = Double((a + b)) / 2.0
  
  // can I code the rounding down
  // logic
  return Int(sum.rounded(.down))
}

//print(average(-4, -5))
//print(average(-5, 4))

