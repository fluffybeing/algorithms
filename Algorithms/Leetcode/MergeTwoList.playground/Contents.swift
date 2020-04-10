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

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
  guard var head1 = l1, var head2 = l2 else { return nil }
  while head1.next != nil || head2.next != nil {
    if head1.val < head2.val {
      head1 = head1.next!
      continue
    } else {
      let temp1 = head1.next!
      let temp2 = head2.next!
      head2.next = nil
      head1.next = head2
      head1.next!.next = temp1
      head2 = temp2
      head1 = head1.next!
    }
  
   if head2.next != nil {
      print(head2.val, head1.val)
      head1.next = head2
      head1 = head1.next!
      break
    }
  }
  return l1
}

let first = ListNode(1)
first.next = ListNode(2)

let second = ListNode(3)
second.next = ListNode(4)

let merge = mergeTwoLists(first, second)
printAll(merge)
