
import Foundation

public class ListNode {
    var val: Int 
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
    }

    func description() {
        var head = self 
        
        print(head.val)
        while (head.next != nil) {
            head = head.next!
            print(head.val)
        }
    }

    func add(_ node: ListNode) {
        var head = self 

        while (head.next != nil) {
            head = head.next!
        }
        head.next = node
    }
}

func sumWithCarry(_ a: Int, _ b: Int, _ carry: Int = 0) -> (Int, Int) {
    let sum = a + b + carry
    let carry = sum / 10

    return (sum % 10, carry)
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var (l1, l2) = (l1, l2)
    var carry = 0
    var result = ListNode(-1)
    let head = result

    while (l1 != nil) || (l2 != nil) || carry != 0 {
        let (s, c) = sumWithCarry(l1?.val ?? 0, l2?.val ?? 0, carry)
        
        if result.val == -1 {
            result.val = s
        } else {
            result.next = ListNode(s)
            result = result.next!
        }

        carry = c
        l1 = l1?.next 
        l2 = l2?.next 
    }

    return head
}

// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8
// Explanation: 342 + 465 = 807.

let nodeOne = ListNode(2)
let nodeTwo = ListNode(5)

nodeOne.add(ListNode(4))
nodeTwo.add(ListNode(6))
nodeOne.add(ListNode(3))
nodeTwo.add(ListNode(8))
nodeTwo.add(ListNode(9))

let result = addTwoNumbers(nodeOne, nodeTwo)
result!.description()
