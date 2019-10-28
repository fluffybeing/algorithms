import Cocoa

func findDuplicates(a: [Int]) -> [Int] {
  guard !a.isEmpty else { return [] }

//  var hashSet: [Int: Int] {
//    var hash = [Int: Int]()
//
//    for elem in a {
//      hash[elem, default: 0] += 1
//    }
//
//    return hash
//  }
//
//  let dups = hashSet.filter({ $0.value > 1 })

  return Array(Set(a))
}


let a = [2, 1, 2, 1]
let result = findDuplicates(a: a)
print(result)
