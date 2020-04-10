import Cocoa

let arr1 = [1, 3, 5]
let arr2 = [2, 4, 6]

func median(_ arr1: [Int], _ arr2: [Int]) -> Double {
  let xCount = arr1.count
  let yCount = arr2.count
  let totalCount = xCount + yCount
  
  var start = 0
  var end = xCount
  
  while start <= end  {
    let midX = (start + end) / 2
    let midY = (totalCount + 1)/2 - midX

    let xMin = midX == 0 ? Int.min : arr1[midX-1]
    let xMax = midX == xCount ? Int.max : arr1[midX]
    
    let yMin = midY == 0 ? Int.min : arr2[midY-1]
    let yMax = midY == yCount ? Int.max : arr2[midY]
    
    if xMin <= yMin && xMax <= yMax {
      if totalCount % 2 == 0 {
        return Double(xMax + yMin) / 2
      } else {
        return Double(xMax) / 2
      }
    } else if xMin > yMin {
      end = midX + 1
    } else {
      start = midX - 1
    }
  }
  return 0.0
}


let val = median(arr1, arr2)
print(val)
