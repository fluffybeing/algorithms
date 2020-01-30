import Cocoa

class ListNode {
  let val: Int
  var next: ListNode?
  
  init(_ val: Int) {
    self.val = val
  }
}

func reverseList(_ head: ListNode?) -> ListNode? {
  var head = head
  var prev: ListNode?
  
  while head != nil {
    let next = head?.next
    head?.next = prev
    prev = head
    head = next
  }
  
  return prev
}
