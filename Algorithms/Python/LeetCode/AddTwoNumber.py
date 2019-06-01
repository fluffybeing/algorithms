#Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
#Output: 7 -> 0 -> 8
#Explanation: 342 + 465 = 807.

class Node(object):
    def __init__(self, x=None):
        self.x = x
        self.next = None
        
    def add(self, x):
        if not self.x:
            self.x = x
        else:
            n = createNode(x)
            while self.next:
                self = self.next
            self.next = n


def printList(node):
    if not node: return
    
    print(node.x)
    node = node.next
    printList(node)


def createNode(n):
    return Node(n)

def addTwoNumbers(l1, l2):
    result = Node()
    while l1.next or l2.next:
        sum = (l1.x + l2.x)
        result.add(sum)
        l1 = l1.next
        l2 = l2.next
    return result

def main():
    l1 = Node()
    l2 = Node()
    
    for i in range(5):
        l1.add(i)
        l2.add(i+4)
#    r = addTwoNumbers(l1, l2)
#printList(r)
    printList(l1)
    printList(l2)
main()
