import Cocoa

class ListNode {
  var val: Int
  var next: ListNode?
  
  init(_ val: Int) {
    self.val = val
  }
}

func printAll(_ head: ListNode?) {
  var head = head
  while head != nil {
    print(head!.val)
    head = head?.next
  }
}

func deleteANode(node: ListNode) {
  // Check if it is the tail node unless return
  guard let next = node.next else { return }
  
  // To delete the node we need to swap the values first
  swap(&node.val, &next.val)
  
  // Now we just need to point the value to next of the node
  node.next = next.next
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)

printAll(head)
deleteANode(node: head.next!)
printAll(head)

