import Cocoa

class Node {
  var next: Node?
  
  let val: Int
  
  init(_ val: Int) {
    self.val = val
  }
}

func printReversedList(_ head: Node?) {
  guard let head = head else { return }
  
  let lastNode = head.val
  printReversedList(head.next)
  
  print(lastNode)
}



let head = Node(5)
head.next = Node(4)
head.next?.next = Node(3)

printReversedList(head)
