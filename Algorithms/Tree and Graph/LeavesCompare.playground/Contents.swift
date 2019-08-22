import Cocoa

class Node {
  var data: Int

  var left: Node?
  var right: Node?

  init(_ data: Int) {
    self.data = data
  }
}

extension Node: Equatable {
  static func == (lhs: Node, rhs: Node) -> Bool {
    return lhs.data == rhs.data
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    return "\(data)"
  }
}

func leafNodes(root: Node?, nodes: inout [Node]) {
  if root == nil {
    return
  }

  leafNodes(root: root?.left, nodes: &nodes)
  if root?.left == nil && root?.right == nil {
    nodes.append(root!)
  }
  leafNodes(root: root?.right, nodes: &nodes)
}

func compare(t1: Node?, t2: Node?) -> Bool {
  // ask what is the base case
  guard let t1 = t1, let t2 = t2 else { return false }

  var leaf1 = [Node]()
  var leaf2 = [Node]()

  leafNodes(root: t1, nodes: &leaf1)
  leafNodes(root: t2, nodes: &leaf2)

  return leaf1 == leaf2
}

let root = Node(2)
root.left = Node(1)
root.right = Node(3)

let root1 = Node(2)
root1.right = Node(4)
root1.right?.left = Node(3)
root1.left = Node(1)

compare(t1: root, t2: root1)
