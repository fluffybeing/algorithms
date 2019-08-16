import Cocoa

func printSubsets(nums: [Int], subsets: [Int], index: Int) {
  if index == nums.count {
    print(subsets)
    return
  }

  var subsets = subsets
  // include the number
  subsets.append(nums[index])
  printSubsets(nums: nums, subsets: subsets, index: index + 1)
  // exclude the number
  subsets.removeLast()
  printSubsets(nums: nums, subsets: subsets, index: index + 1)
}

printSubsets(nums: [1, 2, 3], subsets: [], index: 0)
