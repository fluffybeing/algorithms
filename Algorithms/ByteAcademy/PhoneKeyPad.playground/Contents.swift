import Cocoa

let keyPad = [0: " ", 1: "abc", 2: "cde", 3: "efg"]

func keypadCombinations(_ nums: [Int]) {
  keypadCombinations(nums, index: nums.count)
}

func keypadCombinations(_ nums: [Int], index: Int, path: String = "") {

  if index < 0 {
    print(path)
    return
  }

  let keyPadString = keyPad[index]!.map {
    String($0)
  }

  for char in keyPadString {
    keypadCombinations(nums, index: index - 1, path: char + path)
  }
}

keypadCombinations([1, 2, 3])
