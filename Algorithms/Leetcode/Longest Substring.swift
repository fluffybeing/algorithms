// Input: "abcabcbb"
// Output: 3 
// Explanation: The answer is "abc", with the length of 3. 

func lengthOfLongestSubstring(_ s: String) -> Int {
    guard !s.isEmpty else { return 0 }

    var length = 0
    var substring = [Character]()

    for c in s {
        if substring.contains(c), let index = substring.firstIndex(of: c) {
            length = max(length, substring.count)
            substring.removeSubrange(0...index)
        }
        substring.append(c)
    }

    return max(length, substring.count)
}

func testLengthOfLongestSubstring() {
  let result = lengthOfLongestSubstring("dvdf")
  print(result)
}
