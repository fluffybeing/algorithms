import Cocoa

func printKeyboardCombo(keyboard: [String], index: Int = 0,  nums: [Int], str: String) {
  if index == nums.count {
    print(str)
    return
  }
  
  // get the string associated with number on keypad
  let keypadNumber = nums[index]
  let keypadString = keyboard[keypadNumber]
  
  for char in keypadString {
    printKeyboardCombo(keyboard: keyboard, index: index + 1, nums: nums, str: (str + String(char)))
  }
}

let keypad = ["", "", "ABC", "DEF", "GHI", "JKL", "MNO", "PQRS", "TUV", "WXYZ"]
printKeyboardCombo(keyboard: keypad, index: 0, nums: [2, 3, 4], str: "")
