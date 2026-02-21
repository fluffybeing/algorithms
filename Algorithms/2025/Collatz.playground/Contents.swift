import UIKit

func isCollatzSequence(_ n: Int) -> Bool {
  guard n >= 1 else { return false }
  
  if n == 1 { return true }
  
  if n % 2 == 0 {
    return isCollatzSequence(n / 2)
  } else {
    return isCollatzSequence(3 * n + 1)
  }
}

let result = isCollatzSequence(10)
print(result)
