import Cocoa

class Node {
  var left: Node?
  var right: Node?
  
  let val: Int
  
  init(_ val: Int) {
    self.val = val
  }
 }

extension Node: CustomStringConvertible {
  var description: String {
    return "\(val)"
  }
}

func inorderTraversal(_ root: Node) {
  var stack = [Node]()
  func addLeftTree(node: Node?) {
    var node = node
    while node != nil {
      stack.append(node!)
      node = node?.left
    }
  }
  
  // add the left subtree to stack
  addLeftTree(node: root)
  while !stack.isEmpty {
    let node = stack.popLast()!
    print(node.val)
    
    // add additional left subtree in right node
    addLeftTree(node: node.right)
  }
}

let root = Node(5)
root.left = Node(2)
root.left?.left = Node(1)
root.left?.right = Node(3)
root.right = Node(7)
root.right?.left = Node(6)
root.right?.right = Node(9)

inorderTraversal(root)


