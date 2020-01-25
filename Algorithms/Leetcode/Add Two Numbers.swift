
import Foundation

public class ListNode {
  var val: Int
  var next: ListNode?
  
  var head: ListNode?

  init(_ val: Int) {
    self.val = val
  }

  func description() {
    var current = head
    
    while (current != nil) {
      print(current!.val)
      current = current!.next
    }
  }

  func add(_ node: ListNode) {
    // this special case comes
    // because I have combined the node with
    // linklist
    if head == nil {
      head = ListNode(val)
    }
    
    var current = head!
    while (current.next != nil) {
      current = current.next!
    }
    current.next = node
  }
}

func sumTwoNumber(_ a: Int, _ b: Int, with carry: Int = 0) -> (Int, Int) {
  let sum = a + b + carry
  let carry = sum / 10

  return (sum % 10, carry)
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
  var (l1, l2) = (l1, l2)
  var carry = 0
  var result: ListNode?

  while (l1 != nil) || (l2 != nil) || carry != 0 {
    // any of them can be null
    // TODO: Make elegant use of optionals here
    let (sum, c) = sumTwoNumber(l1?.val ?? 0,
                                l2?.val ?? 0,
                                with: carry)
    if result == nil {
      result = ListNode(sum)
    } else {
      result?.add(ListNode(sum))
    }

    carry = c
    l1 = l1?.next
    l2 = l2?.next
  }

  return result
}

func testAddTwoNumbers() {
  // Input: (2 -> 4 -> 3) + (5 -> 6 -> 8 -> 9)
  // Explanation: 342 + 9865 = 10207.

  let nodeOne = ListNode(2)
  let nodeTwo = ListNode(5)

  nodeOne.add(ListNode(4))
  nodeTwo.add(ListNode(6))
  nodeOne.add(ListNode(3))
  nodeTwo.add(ListNode(8))
  nodeTwo.add(ListNode(9))
  
  let result = addTwoNumbers(nodeOne.head, nodeTwo.head)
  result?.description()
}
