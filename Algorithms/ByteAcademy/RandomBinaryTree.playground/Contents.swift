import Cocoa

// the node randomness should be uniform
// one solution: create an array from the tree
// and use uniform random function O(N) space

class Node {
  let val: Int
  var left: Node?
  var right: Node?
  var children = 0
  
  init(_ val: Int) {
    self.val = val
  }
}


func countChildern(_ root: Node?) -> Int {
  guard let root = root else { return 0 }
  
  return 1 + countChildern(root.left) + countChildern(root.right)
}

func updateChildernCount(_ root: Node?) {
  guard let root = root else {
    return
  }
  
  let children = countChildern(root)
  root.children = children - 1
  
  updateChildernCount(root.left)
  updateChildernCount(root.right)
}

func count(of node: Node) -> Int {
  guard let left = node.left else { return 0 }
  
  return left.children + 1
}

func findNode(with index: Int, in tree: Node?) -> Int {
  guard let root = tree else { return -1 }
  
  // I haven't found a better way to manipulate the index and so
  // keeping this way only
  let rootCount = count(of: root)
  if index == rootCount {
    return root.val
  } else if index < rootCount {
    return findNode(with: index, in: root.left)
  } else {
    let rightNodesCount = index - rootCount - 1
    return findNode(with: rightNodesCount, in: root.right)
  }
}


func randomNode(in tree: Node) -> Int {
  // we can shift this method to initilisation
  // step as it need to run just one time or we
  // get the tree with included children count
  updateChildernCount(tree)
  
  let treeSize = tree.children + 1
  let randomIndex = Int.random(in: 0..<treeSize)
  print("Looking for this: \(randomIndex)")
  return findNode(with: randomIndex, in: tree)
}

let root = Node(1)
root.left = Node(2)
root.right = Node(3)
root.left?.left = Node(4)
root.left?.right = Node(5)
root.right?.left = Node(6)

print(randomNode(in: root))
print(randomNode(in: root))
print(randomNode(in: root))
