import Cocoa

class Node: Hashable {
  weak var parent: Node?

  let data: Int
  var left: Node?
  var right: Node?

  init(_ data: Int) {
    self.data = data
  }
}

extension Node: Equatable {
  static func ==(lhs: Node, rhs: Node) -> Bool {
    return lhs.data == rhs.data
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(data)
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    return "\(self.data)"
  }
}


// Variation 1: When parent pointer is given
func LCA(_ node1: Node,  _ node2: Node) -> Node? {
  var node1 = node1
  var node2 = node2

  var set = Set<Node>()

  while node1.parent != nil {
    node1 = node1.parent!
    set.insert(node1)
  }

  while node2.parent != nil {
    node2 = node2.parent!
    if set.contains(node2) {
      return node2
    }
  }

  return nil
}

// Variation 2: When no parent pointer
func LCA2(_ root: Node?, x: Node, y: Node) -> Node? {
  guard let root = root else { return nil }
  
  // if the any of the given node is the root then return it because
  // there is no node above it
  if root == x || root == y {
    return root
  }
  
  // Now let check if x and y both exits in left
  // or right subtree
  let left = LCA2(root.left, x: x, y: y)
  let right = LCA2(root.right, x: x, y: y)
  
  if let l = left, let r = right {
    return root
  } else if let l = left {
    return left
  } else if let r = right {
    return right
  }
  
  return nil
}


let node1 = Node(1)
let node2 = Node(2)
node2.parent = node1
node1.left = node2
let node4 = Node(4)
node4.parent = node2
node2.left = node4
let node5 = Node(5)
node5.parent = node2
node2.right = node5

let node3 = Node(3)
node3.parent = node1
node1.right = node3

LCA(node3, node2)
let result = LCA2(node1, x: node4, y: node5)
print(result!)
