import Foundation


func selectionSort<T>( items:[T]) -> [T] where T: Comparable {
    
    var items = items
    for index in 0..<items.count {
        var min = index

        for j in index+1..<items.count {
            if items[j] < items[min] { min = j}
        }

        // Swap do not handle the case when we want to swap the
        // same index element, so check the index before
        if min != index {
            swap(&items[index], &items[min])
        }
    }
    return items
}


// Test the function
func selectionSortTest() {
    selectionSort(items: ["b", "a", "c"]) // Expected 1, 4, 6, 7, 10
}
