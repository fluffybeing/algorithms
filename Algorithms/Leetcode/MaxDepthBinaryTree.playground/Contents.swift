import Cocoa

public class TreeNode {
  public var val:
  public var left: TreeNode?
  public var right: TreeNode?
  
  public init(_ val: Int) {
    self.val = val
  }
}

func maxDepth(_ root: TreeNode?) -> Int {
  guard let root = root else { return 0 }
  
  let left = 1 + maxDepth(root.left)
  let right = 1 + maxDepth(root.right)
  
  return max(left, right)
}
