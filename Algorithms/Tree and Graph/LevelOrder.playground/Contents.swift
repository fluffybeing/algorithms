import Cocoa

class Node {
  var data: Int

  var left: Node?
  var right: Node?

  init(_ data: Int) {
    self.data = data
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    return "\(self.data)"
  }
}

func printLevelOrder(root: Node?) {
  guard let root = root else { return }

  var queue: [Node?] = []
  queue.append(root)

  while !queue.isEmpty {
    if let elem = queue.removeFirst() {
      print(elem.data)

      queue.append(elem.left)
      queue.append(elem.right)
    }
  }
}


func printLevelOrderWithMap(root: Node?, level: Int = 1, map: inout [Int: [Node]]) {
  guard let root = root else {
    return
  }

  map[level, default: [Node]()].append(root)

  printLevelOrderWithMap(root: root.left, level: level + 1, map: &map)
  printLevelOrderWithMap(root: root.right, level: level + 1, map: &map)
}

let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.right?.right = Node(5)
root.left?.right = Node(6)
root.left?.left?.left = Node(10)

//printLevelOrder(root: root)
var map = [Int: [Node]]()
printLevelOrderWithMap(root: root, map: &map)

print(map)
