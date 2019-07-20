import Foundation

func insertionSort( items:[Int] ) -> [Int] {
    
  var items = items
  for (index, _) in items.enumerated().dropFirst() {
    var j = index

    while ((j > 0) && (items[j] < items[j-1])) {
      // swap the element
      let a = items[j]
      items[j] = items[j-1]
      items[j-1] = a

      // Increment
      j = j-1
    }
  }
  return items
}


// Test the function
func insertionSortTest() {
  assert(insertionSort(items: [1, 4, 10, 7, 6]) == [1, 4, 6, 7, 10])
  _ = insertionSort(items: [2, 1])
  _ = insertionSort(items: [10, 15, -1, -5])
  // insertionSort([]) Generic type is not taking empty array
}
