import UIKit


func generateSubsets(num: Int) {
  var subsets = [Int]()
  
  func search(k: Int) {
    if k == num + 1 {
      print(subsets)
    } else {
      subsets.append(k)
      search(k: k+1)
      subsets.removeLast()
      search(k: k+1)
    }
  }
  search(k: 1)
}

generateSubsets(num: 3)
