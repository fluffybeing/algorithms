import Cocoa

class Node {
  var data: Int

  var left: Node?
  var right: Node?

  init(_ data: Int) {
    self.data = data
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

let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.right?.right = Node(5)
root.left?.right = Node(6)
root.left?.left?.left = Node(10)

printLevelOrder(root: root)

