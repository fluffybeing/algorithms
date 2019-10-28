import Cocoa

let keypad = [
  [""],
  [""],
  ["A", "B", "C"],
  ["D", "E", "F"],
  ["G", "H", "I"],
  ["J", "K", "L"],
  ["M", "N", "O"],
  ["P", "Q", "R", "S"],
  ["T", "U", "V"],
  ["W", "X", "Y", "Z"]
]

func findKeysCombinations(_ nums: [Int]) {
  findKeysCombinationsUtil(nums, index: 0, combination: "")
}

func findKeysCombinationsUtil(_ nums: [Int], index: Int, combination: String) {
  if index == nums.count {
    print(combination)
    return
  }

  let num = nums[index]
  for char in keypad[num]  {
    findKeysCombinationsUtil(nums, index: index + 1, combination: combination + char)
  }
}


findKeysCombinations([1, 3, 4])
