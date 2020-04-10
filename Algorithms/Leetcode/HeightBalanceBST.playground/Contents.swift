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

func inorderPrint(_ root: TreeNode?) {
  guard let root = root else { return }
  inorderPrint(root.left)
  print(root.val)
  inorderPrint(root.right)
}


func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
  guard !nums.isEmpty else {
    return nil
  }
  
  let mid = nums.count / 2
  let root = TreeNode(nums[mid])
  root.left = sortedArrayToBST(Array(nums[0..<mid]))
  root.right = sortedArrayToBST(Array(nums[(mid+1)...]))
  
  return root
}

let arr = [-10,-3,0,5,9]
let root = sortedArrayToBST(arr)
inorderPrint(root)
