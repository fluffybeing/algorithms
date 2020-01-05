import Cocoa

func longestCommonSubstring(s1: String, s2: String) -> String {
  guard !s1.isEmpty, !s2.isEmpty else { return "" }
  
  let s1 = Array(s1)
  let s2 = Array(s2)
  var maxLength = 0
  var endIndex = 0
  var lcs = Array(repeating: Array(repeating: 0, count: s2.count + 1),
                  count: s1.count + 1)

  for i in 1..<lcs.count {
    for j in 1..<lcs[0].count {
      if s1[i-1] == s2[j-1] {
        lcs[i][j] = lcs[i-1][j-1] + 1
        maxLength = max(lcs[i][j],  maxLength)
        endIndex = i
      } else {
        lcs[i][j] = 0
      }
    }
  }
  
  return String(s1[(endIndex - maxLength)..<endIndex])
}

let result = longestCommonSubstring(s1: "abcdef", s2: "mcde")
print(result)
