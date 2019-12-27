import Cocoa

func reverse(_ stack: inout [Int]) {
  if stack.isEmpty { return }
  let last = stack.popLast()!
  reverse(&stack)
  stack.insert(last, at: 0)
}


var stack = [1, 2, 3]
reverse(&stack)
print(stack)


