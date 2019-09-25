import Cocoa

struct HeapSort {
  var heap = [Int]()

  var peek: Int? {
    return heap.first
  }

  func leftChild(_ parent: Int) -> Int {
    return 2 * parent + 1
  }

  func rightChild(_ parent: Int) -> Int {
    return 2 * parent + 2
  }

  func parent(_ index: Int) -> Int {
    // [0, 1, 2] here parent is 0, how you will get it
    // (2 - 1 / 2) for right child, it will come to 0
    return (index - 1) / 2
  }

  mutating func append(_ elem: Int) {
    heap.append(elem)

    shiftUp(heap.count - 1)
  }

  mutating func remove() {
    heap.removeFirst()

    shiftDown(0)
  }

  mutating func shiftUp(_ index: Int) {
    guard parent(index) >= 0 else { return }

    let p = parent(index)

    if heap[p] > heap[index] {
      heap.swapAt(p, index)

      shiftUp(p)
    }
  }

  mutating func shiftDown(_ index: Int) {
    let left = leftChild(index)
    let right = rightChild(index)

    guard left < heap.count, right < heap.count else {
      return
    }

    if heap[left] < heap[right] {
      if heap[index] > heap[left] {
        heap.swapAt(index, left)
        shiftDown(left)
      }
    } else {
      if heap[index] > heap[right] {
        heap.swapAt(index, right)
        shiftDown(right)
      }
    }
  }

  mutating func heapify() {
    for i in stride(from: heap.count / 2, through: 0, by: -1) {
      shiftDown(i)
    }
  }
}

var heapSort = HeapSort(heap: [33, 41, 7, 15, 55, 86, 28, 22, 94, 9, 11, 10, 8, 99, 16, 27, 51, 83, 2])
heapSort.heapify()
heapSort.remove()
print(heapSort.heap)
