import Cocoa

//dict:   {"abc", "acd", "bcd", "def", "a", "aba"}
//prefix: "a" ‐> "abc", "acd", "a", "aba"
//prefix: "b" ‐> "bcd"

// I am still not sure about this solution
// will look after sometime.

class Node {
  let val: String
  // this will help in lookup
  var children = [String: Node]()
  var isWord: Bool
  
  init(_ val: String, isWord: Bool = false) {
    self.isWord = isWord
    self.val = val
  }
}

extension Node: CustomStringConvertible {
  var description: String {
    return "\(val): \(children)"
  }
}

func insertWord(_ word: String, trie: Node) {
  var current = trie
  
  for (i, char) in word.enumerated() {
    // if the character is not present in the children
    // lets create one with prefix value till that character
    if !current.children.keys.contains(String(char)) {
      let index = word.firstIndex(of: char)!
      let prefix = String(word.substring(to: word.index(after: index)))
      current.children.updateValue(Node(prefix), forKey: String(char))
    }
    
    current = current.children[String(char)]!
    if i == word.count - 1 { current.isWord = true }
  }
}

func prefixes(with prefix: String, in trie: Node) -> [String] {
  var paths = [String]()
  
  var curr = trie
  for char in prefix {
    if curr.children.keys.contains(String(char)) {
      curr = curr.children[String(char)]!
    }
  }
  findWords(curr, paths: &paths)
  return paths
}

func findWords(_ node: Node, paths: inout [String]) {
  if node.isWord {
    paths.append(node.val)
  }
  
  for char in node.children.keys {
    findWords(node.children[String(char)]!, paths: &paths)
  }
}


func autoComplete(_ dict: [String], prefix: String) {
  let trie = Node("")
  dict.forEach({ insertWord($0, trie: trie)})
  print(trie)
  
  let p = prefixes(with: prefix, in: trie)
  print(p)
}



autoComplete(["abc", "acd", "bcd", "def", "a", "aba"], prefix: "a")
