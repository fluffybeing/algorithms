import Foundation

func insertionSort( items:[Int] ) -> [Int] {
    
    var items = items
    for (index, _) in items.enumerated().dropFirst() {
        var j = index

        while ((j > 0) && (items[j] < items[j-1])) {
            swap(&items[j], &items[j-1])
            j = j-1
        }
    }
    return items
}


// Test the function
func insertionSortTest() {
    insertionSort(items: [1, 4, 10, 7, 6]) // Expected 1, 4, 6, 7, 10
    insertionSort(items: [2, 1])
    insertionSort(items: [10, 15, -1, -5])
    // insertionSort([]) Generic type is not taking empty array
}
