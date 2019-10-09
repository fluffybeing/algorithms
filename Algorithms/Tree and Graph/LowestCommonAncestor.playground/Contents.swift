import Cocoa

class Node: Hashable {

  let data: Int
  weak var parent: Node?
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


let node1 = Node(1)
let node2 = Node(2)
node2.parent = node1
node1.left = node2


let node3 = Node(3)
node3.parent = node1
node1.right = node3

LCA(node3, node2)
