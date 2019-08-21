import Cocoa

class Node {
  let data: Int
  var next: Node?

  init(data: Int) {
    self.data = data
  }
}

class LinkList {
  var head: Node?

  func add(node: Node) {
    if head == nil {
      head = node
    } else {
      var n = head
      while n?.next != nil {
        n = n?.next
      }
      n?.next = node
    }
  }

  func printList() {
    while head != nil {
      print(head?.data ?? 0)
      head = head?.next
    }
  }
}


let node1 = Node(data: 1)
let node2 = Node(data: 2)
let node3 = Node(data: 3)

let list = LinkList()

list.add(node: node1)
list.add(node: node2)
list.add(node: node3)
list.printList()


