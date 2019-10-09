import Cocoa

//A message containing letters from A-Z is being encoded to numbers using the following mapping:
//
//'A' -> 1
//'B' -> 2
//...
//'Z' -> 26
//
//Given a non-empty string containing only digits, determine the total number of ways to decode it.


// 1 2 3
// ABC, JC, AW

let alphabets = Array(" ABCDEFGHIJKLMNOPQRSTUVWXYZ")

func decode(_ message: String) -> [String] {
  var path = ""
  var messages = [String]()

  decodeUtil(message,
             index: message.startIndex,
             &path,
             &messages)

  return messages
}

func decodeUtil(_ message: String,
                index: String.Index,
                _ path: inout String,
                _ messages: inout [String]) {
  if index == message.endIndex {
    messages.append(path)
    return
  }

  if message[index] > "0" {
    let alphabet = alphabets[message[index].wholeNumberValue!]
    path.append(alphabet)
    print("first \(path), \(message[index])")
    decodeUtil(message, index: message.index(after: index), &path, &messages)
  }

  // This is a check for bound error, String API is not so swifty
  if index == message.index(before: message.endIndex) { return }

  let nextIndex = message.index(after: index)
  if message[index] < "3" && message[nextIndex] < "7"  {
    // get the alpha value
    let decimalDigit = message[index].wholeNumberValue! * 10
    let unaryDigit = message[nextIndex].wholeNumberValue!
    let alphabet = alphabets[decimalDigit + unaryDigit]
    path.removeSubrange(index...)
    path.append(alphabet)
    print("second \(path), \(message[index])")
    decodeUtil(message, index: message.index(after: nextIndex), &path, &messages)
  }
}

func numDecodings(_ s: String, index: String.Index) -> Int {
  guard !s.isEmpty else {
    return 0
  }

  if s.count == 1 {
    return s[s.startIndex] == "0" ? 0 : 1
  }

  if index >= s.endIndex {
    return 1
  }

  var count = 0
  let nextIndex = s.index(after: index)
  let startIndex = index
  if s[startIndex] > "0" {
    count += numDecodings(s, index: nextIndex)
  }

  if s[startIndex] < "3" && s[nextIndex] < "7" {
    if nextIndex < s.endIndex {
      print(count)
      count += numDecodings(s, index: s.index(after: nextIndex))
    }
  }

  return count
}

let result = numDecodings("123", index: "123".startIndex)
print(result)

// path:
//         123
//     1          23
//   2   23      2  3
//  3    3       3
