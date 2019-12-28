import Cocoa

func reverse(_ stack: inout [Int]) {
  if stack.isEmpty { return }
  let last = stack.popLast()!
  reverse(&stack)
  
  insertAtLast(&stack, element: last)
}

// 1, 2, 3
func insertAtLast(_ stack: inout [Int], element: Int) {
  if stack.isEmpty {
    stack.append(element)
    return
  }
  
  let temp = stack.popLast()!
  insertAtLast(&stack, element: element)
  stack.append(temp)
}


var stack = [1, 2, 3]
reverse(&stack)
print(stack)


