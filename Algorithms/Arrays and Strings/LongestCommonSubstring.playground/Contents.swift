import Cocoa


// "ABAB", "BABA" ->  "ABA"
//
func longestCommonSubstring(_ a: String, _ b: String) -> String {

  // guard if the strings are empty
  var i = a.startIndex, j = b.startIndex

  var max_so_far = 0, max_here = 0
  var start = a.startIndex, end = a.startIndex

  while i < a.endIndex && j < b.endIndex {
    if a[i] == b[j] {
      max_here += 1
      if max_here == 1 {
        start = i
      }
      j = b.index(after: j)
    } else {
      max_here = 0
    }

    if max_here > max_so_far {
      max_so_far = max_here
      end = i
    }
    i = a.index(after: i)
  }

  return String(a[start...end])
}


let r = longestCommonSubstring("A", "A")
print(r)
