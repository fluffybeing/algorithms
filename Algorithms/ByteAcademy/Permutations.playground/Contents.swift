import Cocoa

func permuations(_ list: [Int]) {
  var list = list
  permutations(&list, 0)
}

func permutations(_ list: inout [Int], _ index: Int) {
  if index == list.count - 1 {
    print(list)
  }

  for i in index..<list.count {
    list.swapAt(i, index)
    permutations(&list, index + 1)
    list.swapAt(i, index)
  }
}


let result = permuations([1, 2, 3])

