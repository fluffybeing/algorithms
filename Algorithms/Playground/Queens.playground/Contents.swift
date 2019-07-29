import UIKit

//func reverseString(str: String, index: Int) -> String {
//  let size = str.count
//  if size == index {
//    return ""
//  }
//
//  return String(Array(str)[size - 1 - index]) + reverseString(str: str, index: index + 1)
//}
//
//
//reverseString(str: "abc", index: 0)


func wildCard(str: [Character], index: Int) {
  var str = str

  if index == str.count {
    print(String(str))
    return
  }

  if str[index] == "?" {
    for i in 0..<2 {
      str[index] = Character(String(i))
      wildCard(str: str, index: index)
    }
    return
  }
  wildCard(str: str, index: index + 1)
}

wildCard(str: ["0", "?", "?"], index: 0)
