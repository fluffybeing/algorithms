import Cocoa

class Node {
  var next: Node?
  var randomNext: Node?
  
  let val: Int
  init(_ val: Int) {
    self.val = val
  }
}

func printLL(_ head: Node?) {
  var head = head
  while head != nil {
    print(head!.val)
    head = head?.next
  }
}


// Solution with extra space:
// Maintain a hastable of old vs new node
// easy cloning
func cloneLinkedList(_ head: Node?) -> Node? {
  // first create copy of each node
  var current = head
  while current != nil {
    let node = Node(current!.val)
    
    node.next = current?.next
    current?.next = node
    
    current = node.next
  }
  
  // Now we need to process the random pointers
  // save the cloned head
  let clonedHead = head?.next
  current = head
  while current != nil {
    let clonedNode = current?.next
    
    clonedNode?.randomNext = current?.randomNext?.next
    clonedNode?.next = current?.next?.next
    current?.next = current?.next?.next
    current = current?.next
  }
  
  return clonedHead
}


let head = Node(1)
head.next = Node(2)
head.next?.next = Node(3)
head.next?.next?.next = Node(4)

let newHead = cloneLinkedList(head)
printLL(newHead)
