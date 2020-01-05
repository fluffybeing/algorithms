import Cocoa


class Node {
  let val: Character
  var children = [Character: Node]()
  var isWord: Bool
  
  init(_ val: Character, isWord: Bool = false) {
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
    if !current.children.keys.contains(char) {
      current.children.updateValue(Node(char), forKey: char)
    }
    
    current = current.children[char]!
    if i == word.count - 1 { current.isWord = true }
  }
}

func countDeletion(_ word: String, trie: Node) -> Int {
  
  var curr = trie
  var counter = 0
  for char in word {
    if curr.children.keys.contains(char) {
      curr = curr.children[char]!
      counter += 1
    } else {
      break
    }
  }
  
  return word.count - counter
}

func stringDeletion(_ dict: [String], word: String) -> Int {
  let trie = Node(Character("≈"))
  dict.forEach({ insertWord($0, trie: trie)})
  
  return countDeletion(word, trie: trie)
}

let result = stringDeletion(["a", "aa", "aab"], word: "aaa")
print(result)
