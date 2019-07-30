import Cocoa

func minimumSwaps(arr: [Int]) -> Int {
  var minSwaps = 0
  var arr = arr
  let sortedArr = arr.sorted()
  
  for i in 0..<arr.count {
    for j in 0..<arr.count {
      if arr[i] < arr[j] {
        arr.swapAt(i, j)
        minSwaps += 1
        
      }
      if sortedArr == arr {
        return minSwaps
      }
    }
  }
  print(arr)
  return minSwaps
}

minimumSwaps(arr: [1, 3, 5, 2, 4, 6, 7])
minimumSwaps(arr: [4, 3, 2, 1])


