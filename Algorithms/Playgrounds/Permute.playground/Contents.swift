import Cocoa

func permute(array: [Int], start: Int, end: Int) {
  var array = array
//  print(array)
  if start == end {
    print(array)
    return
  }
  for i in 0...end {
    array.swapAt(start, i)
    permute(array: array, start: i+1, end: end)
    array.swapAt(start, i)
//    permute(array: array, start: i+1, end: end)
  }
}

//let array = [1, 2, 3]
//permute(array: array, start: 0, end: 2)



//            1, 2, 3    0 , 2
//     1
//[2, 1, 3]

func permuteWirth<T>(_ a: [T], _ n: Int) {
  if n == 0 {
    print(a)   // display the current permutation
    return 
  } else {
    var a = a
    permuteWirth(a, n - 1)
    for i in 0..<n {
      a.swapAt(i, n)
      permuteWirth(a, n - 1)
      a.swapAt(i, n)
    }
  }
}
let letters = ["a", "b", "c",]
permuteWirth(letters, letters.count - 1)
