import Cocoa

public class TreeNode {
  public var val: Int
  public var left: TreeNode?
  public var right: TreeNode?
  
  public init(_ val: Int) {
    self.val = val
    self.left = nil
    self.right = nil
  }
}

func sum(_ root: TreeNode?) -> Int {
  guard let root = root else { return 0 }
  
  return sum(root.left) + sum(root.right) + root.val
}


func maxProduct(_ root: TreeNode?, totalSum: Int, oldMax: Int = Int.min) -> Int {
  guard let root = root else { return 0 }
  
  let left = sum(root.left)
  let right = sum(root.right)
  let currentMax = max((totalSum - right) * right,
                       left * (totalSum - left))
  
  return max(currentMax, oldMax)
}

func maxProduct(_ root: TreeNode?) -> Int {
  let totalSum = sum(root)
  
  return maxProduct(root, totalSum: totalSum)
}

let root = TreeNode(1)
root.left = TreeNode(2)
root.right = TreeNode(3)
root.left?.left = TreeNode(4)
root.left?.right = TreeNode(5)
root.right?.left = TreeNode(6)

//let result = maxProduct(root)
//print(result)

var url = URL(string: "grab://superapp/ticketing?code=74a2888695cb4989889f9692446c8cea&state=c80bd37f-c36b-4db9-985c-1b6e46712d5d")!
let components = URLComponents(url: url, resolvingAgainstBaseURL: true)
components?.queryItems
components?.host
var d = URLComponents(string: "grab://open?screenType=Hello")!
d.queryItems?.append(contentsOf: components?.queryItems ?? [])
d.url
